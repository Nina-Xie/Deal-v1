import json
from flask import Flask, request
from Deal_db import db, Post, Comment, User

app = Flask(__name__)
db_filename = 'todo.db'

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()
    # user1 = User(netid="sh2429", username="Joyce", description="genius")
    # user2 = User(netid="xz598", username="Elephant", description="stupid")
    # # post1 = Post(itemname="1984", itemtype="book", price=100.0, description="A nice book", item_condition="like new", username="Xiangyi", user_id=1)
    # # post2 = Post(itemname="banana", itemtype="food", price=5.0, description="A nice banana", item_condition="like new", username="Xiangyi", user_id=1)
    # db.session.add(user1)
    # db.session.add(user2)
    # # db.session.add(post1)
    # # db.session.add(post2)
    # db.session.commit()

@app.route('/')
@app.route('/api/users/')
def get_users():
    users = User.query.all()
    res = {'success':True, 'data':[user.serialize() for user in users]}
    return json.dumps(res), 200

@app.route('/api/user/<int:user_id>/')
def get_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is not None:
        return json.dumps({'success':True, 'data':user.serialize()}), 200
    return json.dumps({'success':False, 'error':'User not found'}), 404

#expected property name enclosed in the double quote
@app.route('/api/user/', methods = ['POST'])
def create_user():
    post_body = json.loads(request.data)
    user = User(
        score = 0,
        netid = post_body.get('netid'),
        username = post_body.get('username'),
        description = post_body.get('description')
    )
    db.session.add(user)
    db.session.commit()
    return json.dumps({'success':True, 'data':user.serialize()}), 201

@app.route('/api/posts/')
def get_posts():
    posts = Post.query.all()
    res = {'success':True, 'data':[post.serialize() for post in posts]}
    return json.dumps(res), 200

@app.route('/api/user/post/<int:user_id>/', methods = ['POST'])
def create_post(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is not None:
        post_body = json.loads(request.data)
        post = Post(
            score = 0,
            itemname = post_body.get("itemname"),
            itemtype = post_body.get("itemtype"),
            price = post_body.get("price"),
            description = post_body.get("description"),
            item_condition = post_body.get("item_condition"),
            username = user.username,
            user_id = user.id
        )
        user.posts.append(post)
        db.session.add(post)
        db.session.commit()
        return json.dumps({'success':True, 'data':post.serialize()}), 201
    return json.dumps({'success':False, 'error':'User not found'}), 404

@app.route('/api/post/<int:post_id>/')
def get_post(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is not None:
        return json.dumps({'success':True, 'data':post.serialize()}), 200
    return json.dumps({'success':False, 'error':'Post not found'}), 404
        
@app.route('/api/post/<int:post_id>/', methods = ['POST'])
def update_post(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is not None:
        post_body = json.loads(request.data)
        post.itemname = post_body.get('itemname', post.itemname)
        post.itemtype = post_body.get('itemtype', post.itemtype)
        post.price = post_body.get('price', post.price)
        post.description = post_body.get('description', post.description)
        post.item_condition = post_body.get('item_condition', post.item_condition)
        db.session.commit()
        return json.dumps({'success':True, 'data':post.serialize()}), 200
    return json.dumps({'success':False, 'error':'Post not found'}), 404

@app.route('/api/post/<int:post_id>/', methods = ['DELETE'])
def delete_post(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is not None:
        db.session.delete(post)
        db.session.commit()
        return json.dumps({'success':True, 'data':post.serialize()}), 200
    return json.dumps({'success':False, 'error':'Post not found'}), 404

@app.route('/api/post/<int:post_id>/comments/')
def get_comments(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is not None:
        comments = [comment.serialize() for comment in post.comments]
        return json.dumps({'success':True, 'data':comments}), 200
    return json.dumps({'success':False, 'error':'Post not found'}), 404          

@app.route('/api/post/<int:user_id>/<int:post_id>/comment/', methods = ['POST'])
def create_comment(post_id, user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is not None:
        post = Post.query.filter_by(id=post_id).first()
        if post is not None:
            post_body = json.loads(request.data)
            comment = Comment(
                score = 0,
                text = post_body.get('text'),
                username = user.username,
                post_id = post.id
            )
            post.comments.append(comment)
            user.comments.append(comment)
            db.session.add(comment)
            db.session.commit()
            return json.dumps({'success':True, 'data':comment.serialize()}), 201
        return json.dumps({'success':False, 'error':'Post not found'}), 404
    return json.dumps({'success':False, 'error':'User not found'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

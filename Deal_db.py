from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    __tablename__='user'
    id = db.Column(db.Integer, primary_key = True)
    netid = db.Column(db.String, nullable = False)
    username = db.Column(db.String, nullable = False)
    description = db.Column(db.String, nullable = True)
    posts = db.relationship('Post', cascade = 'delete')
    comments = db.relationship('Comment', cascade = 'delete')

    def __init__(self, **kwargs):
        self.netid = kwargs.get('netid', '')
        self.username = kwargs.get('username', '')
        self.description = kwargs.get('description', '')
        self.posts = []
        self.comments = []

    def serialize(self):
        return {
            'id': self.id,
            'netid': self.netid,
            'username': self.username,
            'description': self.description,
            'posts': [a.serialize() for a in self.posts],
            'comments': [a.serialize() for a in self.comments]
        }

class Post(db.Model):
    __tablename__='post'
    id = db.Column(db.Integer, primary_key = True)
    score = db.Column(db.Integer, nullable = False)
    itemname = db.Column(db.String, nullable = False)
    itemtype = db.Column(db.String, nullable = False)
    price = db.Column(db.Float, nullable = False)
    description = db.Column(db.String, nullable = False)
    item_condition = db.Column(db.String, nullable = False)
    username = db.Column(db.String, nullable = False)
    comments = db.relationship('Comment', cascade ='delete')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable = False)

    def __init__(self, **kwargs):
        self.score = kwargs.get('score', 0)
        self.itemname = kwargs.get('itemname','Mysterious item')
        self.itemtype = kwargs.get('itemtype', 'Others')
        self.price = kwargs.get('price', 0.0)
        self.description = kwargs.get('text', 'N/A')
        self.item_condition = kwargs.get('item_condition', 'N/A')
        self.username = kwargs.get('username', 'Anonymous user')
        self.user_id = kwargs.get('user.id')

    def serialize(self):
        return {
            'id': self.id,
            'score': self.score,
            'itemname': self.itemname,
            'itemtype': self.itemtype,
            'price': self.price,
            'description': self.description,
            'item_condition': self.item_condition,
            'username': self.username,
            'comments': [a.serialize() for a in self.comments]
        }

class Comment(db.Model):
    __tablename__='comment'
    id = db.Column(db.Integer, primary_key=True)
    score = db.Column(db.Integer, nullable = False)
    text = db.Column(db.String, nullable = False)
    username = db.Column(db.String, nullable = False)
    post_id = db.Column(db.Integer, db.ForeignKey('post.id'), nullable = False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable = False)

    def __init__(self, **kwargs):
        self.score = kwargs.get('score', 0)
        self.text = kwargs.get('text', '')
        self.username = kwargs.get('username','')
        self.post_id = kwargs.get('post_id')
        self.user_id = kwargs.get('user_id')

    def serialize(self):
        return {
            'id': self.id,
            'score': self.score,
            'text': self.text,
            'username': self.username
        }
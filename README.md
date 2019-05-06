# Deal
Created by: <i>Yichen Feng (iOS), Nina Xie (iOS), Joyce Huang (Backend), Xiangyi Zhao (Backend)</i>

<strong> A buying and selling app designed for the Cornell community </strong> 

<p>Deal helps Cornell students to sell their used items that are not needed anymore as well as buy used items from others with cheaper prices. </p>

<p>The users first start with signing in with their Google accounts. After loading, they can view all items that are currently on the platform on the "Deal" explore page. Through the search bar, they can search for a specific keyword in items' names or descriptions. 
Clicking into a specific item cell, they can view more information of it, including the item name, price, description and images, on its Detail View. They can scroll the description text vertically to see the full length, and can scroll the image collection view horizontally to see all images (up to 6). 
Tabbing on the seller button, they can go into the seller's profile page and see seller information. 
Back on the item's detail view, through the tool bar on the bottom, one can add the item to "My Favorites" or view and leave comments. </p>

<p>The users can navigate to their own profile page to change the profile picutre and user information. They can also view their favorited and on sale items.</p>

<p>Users can post their own items to the platform through the add feature. Later if an item is sold or the seller wants to delete it, the seller will be able to remove that on its detail page. </p>

<p>Deal does not yet accomplish all of our envisioned features such as sending system notifications to users and message chatting between buyers and sellers. We would love to further work on Deal to actually bring it to our campus in the future.


### Login, User Profile Page (Favorites and OnSale)
### Home Screen: Items Display, Search Bar
### Detail Screen: Item Info, Seller Page/Like/Comment
### Post Screen: Post New Item


### iOS:
NSLayoutConstraint - used to place views as designed, and fit various screen dimensions.

GoogleSignIn API - implemented to get information of the user that is currently signed in.

UITabBarController - displayed at bottom of main ViewControllers with icons for each screen, and ability to navigate between screens. User is brought to their desired page upon click of an icon.

UICollectionView - implemented in DealVC for items and DetailVC for images. 
UITableView - implements in CommentVC for comments.

UIImagePickerController - integrated for the user to upload item images and profile picture.


### Backend:
Deal Spec

Expected Functionality
Get all users
Request: `GET /api/users/
Description: Return all the users in the database, including their user id, googleID, netid, username, description, posts, and comments.
Response:

    {
        "success": true,
        "data": [
            {
                "id": 1,
                "googleID": "hhhhh",
                "netid": "sh2429",
                "username": "Joyce",
                "description": "CS vegetable bird",
                "posts": [],
                "comments": [
                    {
                        "id": 2,
                        "score": 0,
                        "text": "I also want to buy this",
                        "username": "Joyce"
                    }
                ]
                "favouritePosts":[1, 2]
            },
            {
                "id": 2,
                "googleID" : "xswl",
                "netid": "xz598",
                "username": "Xiangyi",
                "description": " ECE vegetable chicken",
                "posts": [
                    {
                        "id": 2,
                        "googleID": "xswl",
                        "score": 0,
                        "itemname": "Harry Potter",
                        "itemtype": "book",
                        "price": 90,
                        "description": "by J.K. Rowling",
                        "item_condition": "very good",
                        "username": "Xiangyi",
                        "comments": [
                            {
                                "id": 1,
                                "score": 0,
                                "text": "I want to buy this",
                                "username": "Emily"
                            },
                            {
                                "id": 2,
                                "score": 0,
                                "text": "I also want to buy this",
                                "username": "Joyce"
                            }
                        ]
                    }
                ],
                "comments": []
            }
        ]
    }


Get one user
Request: `GET /api/user/<string:googleID>/
Example: `GET /api/user/hhhhh/
Description: Return one user with the given googleID, including its user id, googleID, netid, username, description, posts, and comments.
Response:

    {
        "success": true,
        "data": {
            "id": 2,
            "googleID": "hhhhh",
            "netid": "sh2429",
            "username": "Shuyan Huang",
            "description": "CS vegetable bird",
            "posts": [],
            "comments": []
        }
    }


Create a new user

Request: `POST/api/user/
Description: Create a new user using googleID, netid, username, and description. The user is created with no initial posts or comments. Return the user.
Response:

    {
        "success": true,
        "data": {
            "id": 3,
            "googleID": "zezeze",
            "netid": "yz476",
            "username": "Yihan Zhang",
            "description": "CS genius",
            "posts": [],
            "comments": []
        }
    }


Get all posts
Request: `GET/api/posts/
Description: Return all the posts in the database, including their post id, googleID (the same with the user’s), score, itemname, itemtype, price, description, item condition, username, and comments.
Response:

    {
        "success": true,
        "data": [
            {
                "id": 1,
                "googleID": "hhhhh",
                "score": 0,
                "itemname": "Game of Thrones",
                "itemtype": "book",
                "price": 100,
                "description": "by Goerge R. R. Martin",
                "item_condition": "like new",
                "username": "Joyce",
                "comments": []
            },
            {
                "id": 2,
                "googleID": "xswl",
                "score": 0,
                "itemname": "Harry Potter",
                "itemtype": "book",
                "price": 95,
                "description": "by J.K. Rowling",
                "item_condition": "very good",
                "username": "Xiangyi",
                "comments": [
                    {
                        "id": 3,
                        "score": 0,
                        "text": "I want to buy this",
                        "username": "Emily"
                    },
                    {
                        "id": 2,
                        "score": 0,
                        "text": "I also want to buy this",
                        "username": "Joyce"
                    }
                ]
            }
        ]
    }


Get posts by user
Request: `GET/api/posts/<string:googleID>/`
Description: Return all the posts posted by the user with googleID, including their post id, googleID (the same with the user’s), score, itemname, itemtype, price, description, item condition, username, and comments.
Response:

    {
    }
    
Get one post
Request: `GET` `/ap``i``/``post/<int:post_id>/`
Description: Return one post with the given post_id, including its googleID, score, itemname, itemtype, price, description, item condition, username, and comments.
Response:

    {
        "success": true,
        "data": {
            "id": 1,
            "googleID": "hhhhh",
            "score": 0,
            "itemname": "Game of Thrones",
            "itemtype": "book",
            "price": 100,
            "description": "by Goerge R. R. Martin",
            "item_condition": "like new",
            "username": "Joyce",
            "comments": []
        }
    }


Create a new post
Request: `POST/api/user/post/<string:googleID>/`
Example: `POST` `/api/user/post/hhhhh/`
Description: Create a new post posted by user with googleID using itemname, itemtype, price, description, and item condition. Username is automatically get from the googleID entered. Return the post.
Response:

    {
        "success": true,
        "data": {
            "id": 1,
            "googleID": "hhhhh",
            "score": 0,
            "itemname": "Game of Thrones",
            "itemtype": "book",
            "price": 100,
            "description": "by Goerge R. R. Martin",
            "item_condition": "like new",
            "username": "Joyce",
            "comments": []
        }
    }


Update a post
Request: `POST/api/post/<int:post_id>/`
Description: Update a post with post_id with corresponding itemname, itemtype, price, description, and item condition. post_id, googleID, and username are not applicable for editing. Return the updated post.
Response:

    {
        "success": true,
        "data": {
            "id": 2,
            "googleID": "xswl",
            "score": 0,
            "itemname": "Harry Potter",
            "itemtype": "book",
            "price": 90,
            "description": "by J.K. Rowling",
            "item_condition": "very good",
            "username": "Xiangyi",
            "comments": []
        }
    }


Like a post
Request: `POST/api/favouritePosts/<string:user_id>/<int:post_id>/`
Description: Like a post with post_id by a user with googleID. Return a list of post_ids that the user has liked.
Response:

    {
        "success": true,
        "data": {
            "likedPosts": [
                {
                    "id": 1
                }
            ]
        }
    }


Get liked posts
Request: `GET/api/favouritePosts/<string:user_id>/`
Description: Return a list of posts that the user has liked.
Response:

    {
        "success": true,
        "data": {
            "id": 1,
            "googleID": "hhhhh",
            "score": 0,
            "itemname": "Game of Thrones",
            "itemtype": "book",
            "price": 100,
            "description": "by Goerge R. R. Martin",
            "item_condition": "like new",
            "username": "Joyce",
            "comments": []
        }
    }
    
Delete a post
Request: `DELETE/api/post/<int:post_id>/`
Description: Delete a post with post id. Return the deleted post.
Response:

    {
        "success": true,
        "data": {
            "id": 1,
            "googleID": "hhhhh",
            "score": 0,
            "itemname": "Game of Thrones",
            "itemtype": "book",
            "price": 100,
            "description": "by Goerge R. R. Martin",
            "item_condition": "like new",
            "username": "Joyce",
            "comments": []
        }
    }


Get all comments to a post
Request: `GET/api/post/<int:post_id>/comments/`
Description: Return all the comments in the database related to the post with post_id, including their comment id, score, text, and username.
Response:

    {
        "success": true,
        "data": [
            {
                "id": 1,
                "score": 0,
                "text": "I want to buy this",
                "username": "Emily"
            },
            {
                "id": 2,
                "score": 0,
                "text": "I also want to buy this",
                "username": "Joyce"
            }
        ]
    }


Create a new comment
Request: `POST/api/post/post/<string:googleID>/<int:post_id>/comment/`
Description: Create a new comment by user with googleID and relate it to the post with post_id using text. Username is automatically got from the googleID entered. Return the comment.
Response:

    {
        "success": true,
        "data": {
            "id": 1,
            "score": 0,
            "text": "I want to buy this",
            "username": "Emily"
        }
    }


## Authors:
<p>Yichen Feng</p>
<p>Nina Xie</p>
<p>Joyce Huang</p>
<p>Xiangyi Zhao</p>

©2019 by Fx&Hz

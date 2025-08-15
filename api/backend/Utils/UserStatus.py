from mysql.connector import Error
from backend.db_connection import db 

# Utility function to check if user is author of post
def is_post_author(user_id, advertiser_id, post_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Post WHERE (AuthorId = %s OR AdvertiserId = %s) AND PostId = %s", (user_id, advertiser_id, post_id))
        cursor.close()
        return cursor.fetchone() is not None
    except Error as e:
        return e

# Utility function to check if user is author of original comment
def is_comment_author(user_id, comment_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Comment WHERE AuthorId = %s AND CommentId = %s", (user_id, comment_id))
        cursor.close()
        return cursor.fetchone() is not None
    except Error as e:
        return e
    
# Check if a user is a moderator
def is_moderator(user_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Users WHERE UserId = %s AND FIND_IN_SET('Moderator', Role) > 0", (user_id,))
        cursor.close()
        return cursor.fetchone() is not None
    except Error as e:
        return e
    
# Check if a user created a certain event
def is_event_host(user_id, event_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Event WHERE HostId = %s AND EventId = %s", (user_id, event_id))
        cursor.close()
        return cursor.fetchone() is not None
    except Error as e:
        return e
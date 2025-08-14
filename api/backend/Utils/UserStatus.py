from mysql.connector import Error
from backend.db_connection import db 

# Utility function to check if user is author of original comment
def is_comment_author(user_id, comment_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Comment WHERE AuthorId = %s AND CommentId = %s", (user_id, comment_id))
        return cursor.fetchone() is not None
    except Error as e:
        return e
    
# Check if a user is a moderator
def is_moderator(user_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Users WHERE UserId = %s AND FIND_IN_SET('Moderator', Role) > 0", (user_id,))
        return cursor.fetchone() is not None
    except Error as e:
        return e
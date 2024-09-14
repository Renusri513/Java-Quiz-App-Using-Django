from django.shortcuts import render,redirect
from django.http import HttpRequest,HttpResponse
import mysql.connector
from django.conf import settings
import os
from .models import  user,Quiz
import mysql.connector
import hashlib
import re
from django.http import JsonResponse
from django.db import connection

import re  # Import the regular expressions module
def index(request):

    return render(request,'index.html')
# Create your views here.
def about(request):

    return render(request,'about.html')
#signup -----------------------------------------------
def signup(request):
    if request.method == "POST":
        user_name = request.POST['username']  # Fetch username field from form
        email = request.POST['email']
        phone_no = request.POST['phone']
        password = request.POST['password']

        # Connect to MySQL
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="javaquizapp"
        )
        mycursor = conn.cursor()

        # Check if the username already exists
        mycursor.execute("SELECT * FROM user WHERE user_name = %s", (user_name,))
        uname_exists = mycursor.fetchone()

        if uname_exists:
            return render(request, 'signup.html', {"status": "**The given Username already exists"})

        # Check if the email already exists
        mycursor.execute("SELECT * FROM user WHERE email = %s", (email,))
        email_exists = mycursor.fetchone()

        if email_exists:
            return render(request, 'signup.html', {"status": "**The given Email already exists"})

        # If everything is fine, insert the new user
        mycursor.execute("INSERT INTO user (user_name, email, phone_no, password) VALUES (%s, %s, %s, SHA1(%s))", 
                         (user_name, email, phone_no, password))
        conn.commit()

        # Redirect to login page after successful signup
        return redirect('login')

    # Render the signup page if the request method is GET
    return render(request, 'signup.html')
#login function-------------------------------------------------------------------



def login(request):
    if request.method == "POST":
        unEid = request.POST['usernameEmail'].strip()
        pwd = request.POST['password'].strip()
        print("User Input Password (before hashing):", pwd)

        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="javaquizapp"
        )
        mycursor = conn.cursor()

        # Check if the input is an email address or a username
        if re.match(r"[^@]+@[^@]+\.[^@]+", unEid):  # If it matches an email format
            query = "SELECT * FROM user WHERE email = %s"
        else:
            query = "SELECT * FROM user WHERE user_name = %s"

        mycursor.execute(query, (unEid,))
        result = mycursor.fetchone()

        if result is not None:
            stored_password_hex = result[3]  # Assuming password is stored in the 4th column (adjust if needed)
            hashed_input_password = hashlib.sha1(pwd.encode()).hexdigest()

            print("Stored Password (hexadecimal):", stored_password_hex)
            print("Input Password (hashed):", hashed_input_password)

            if hashed_input_password == stored_password_hex:
                request.session["username"] = unEid
                return redirect('quiz_list')  # Redirect to home page after successful login
            else:
                # Return invalid password error
                return render(request, "login.html", {"status": "**Invalid credentials**"})
        else:
            # Return user not found error
            return render(request, "login.html", {"status": "**User not found**"})

    return render(request, 'login.html')
#Admin login________________________________________________________________
def adminlogin(request):
    if request.method == "POST":
        unEid = request.POST['usernameEmail'].strip()
        pwd = request.POST['password'].strip()
        print("User Input Password (before hashing):", pwd)

        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="javaquizapp"
        )
        mycursor = conn.cursor()

        # Check if the input is an email address or a username
        if re.match(r"[^@]+@[^@]+\.[^@]+", unEid):  # If it matches an email format
            query = "SELECT * FROM admin WHERE email = %s"
        else:
            query = "SELECT * FROM admin WHERE user_name = %s"

        mycursor.execute(query, (unEid,))
        result = mycursor.fetchone()

        if result is not None:
            stored_password_hex = result[3]  # Assuming password is stored in the 4th column (adjust if needed)
            hashed_input_password = hashlib.sha1(pwd.encode()).hexdigest()

            print("Stored Password (hexadecimal):", stored_password_hex)
            print("Input Password (hashed):", hashed_input_password)

            if hashed_input_password == stored_password_hex:
                request.session["username"] = unEid
                return redirect('adminhome')  # Redirect to home page after successful login
            else:
                # Return invalid password error
                return render(request, "adminlogin.html", {"status": "**Invalid credentials**"})
        else:
            # Return user not found error
            return render(request, "adminlogin.html", {"status": "**User not found**"})

    return render(request, 'adminlogin.html')
#logout function-------------------------------------------------------------
def logout(request):
    try:
        if('username' in request.session):
            del request.session["username"]
    except KeyError:
        pass
    return render(request,'login.html')


#dashboard___________________________________________________________________________________

def dashboard(request):
    # Check if the user is logged in (session-based authentication)
    if 'username' not in request.session:
        return redirect('login')  # Redirect to login if not logged in
    else:
        try:
            # MySQL database connection
            conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="javaquizapp"
            )
            mycursor = conn.cursor()

            # Query to fetch topics
            mycursor.execute("SELECT topic_id, topic_name FROM topic")
            topics = mycursor.fetchall()

            # Process topics and prepare the dashboard data
            dashboard_data = []
            for topic_id, topic_name in topics:
                mycursor.execute("SELECT quiz_id, quiz_name, difficulty FROM quiz WHERE topic_id = %s", (topic_id,))
                quizzes = mycursor.fetchall()
                quiz_list = [{"quiz_id": quiz[0], "quiz_name": quiz[1], "difficulty": quiz[2]} for quiz in quizzes]
                dashboard_data.append({"topic_id": topic_id, "topic_name": topic_name, "quizzes": quiz_list})

            conn.close()  # Close the database connection

            # Render the dashboard with the data
            return render(request, 'dashboard.html', {"dashboard_data": dashboard_data})

        except mysql.connector.Error as err:
            print(f"Error: {err}")
            return JsonResponse({"error": "Database connection error"}, status=500)

def get_dashboard_data(request):
    # Check if the user is logged in (session-based authentication)
    if 'username' not in request.session:
        return redirect('login')  # Redirect to login if not logged in
    else:
        try:
            # MySQL database connection
            conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="javaquizapp"
            )
            mycursor = conn.cursor()

            # Query to fetch topics
            mycursor.execute("SELECT topic_id, topic_name FROM topic")
            topics = mycursor.fetchall()

            # Prepare the dashboard data
            dashboard_data = []
            for topic_id, topic_name in topics:
                mycursor.execute("SELECT quiz_id, quiz_name, difficulty FROM quiz WHERE topic_id = %s", (topic_id,))
                quizzes = mycursor.fetchall()
                quiz_list = [{"quiz_id": quiz[0], "quiz_name": quiz[1], "difficulty": quiz[2]} for quiz in quizzes]
                dashboard_data.append({"topic_id": topic_id, "topic_name": topic_name, "quizzes": quiz_list})

            conn.close()  # Close the database connection

            return JsonResponse(dashboard_data, safe=False)

        except mysql.connector.Error as err:
            print(f"Error: {err}")
            return JsonResponse({"error": "Database connection error"}, status=500)


def get_quizzes_by_topic_difficulty(request):
    # Check if the user is logged in (session-based authentication)
    
    if 'username' not in request.session:
        return redirect('login')  # Redirect to login if not logged in
    else:
        topic_id = request.GET.get('topic')
        difficulty = request.GET.get('difficulty')

        if not topic_id or not difficulty:
            return JsonResponse({"error": "Missing parameters"}, status=400)

        try:
            topic_id = int(topic_id)
        except ValueError:
            return JsonResponse({"error": "Invalid topic ID"}, status=400)

        try:
            # MySQL database connection
            conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="javaquizapp"
            )
            mycursor = conn.cursor()

            # Query to fetch quizzes based on topic and difficulty
            mycursor.execute(
                "SELECT quiz_id, quiz_name FROM quiz WHERE topic_id = %s AND difficulty = %s",
                (topic_id, difficulty)
            )
            quizzes = mycursor.fetchall()
            quiz_list = [{"quiz_id": quiz[0], "quiz_name": quiz[1]} for quiz in quizzes]

            conn.close()  # Close the database connection

            return JsonResponse(quiz_list, safe=False)

        except mysql.connector.Error as err:
            print(f"Error: {err}")
            return JsonResponse({"error": "Database connection error"}, status=500)

#quiz________________________________________________________________________________________
def quiz(request):
    if 'username' not in request.session:
        return redirect('login') 
    
    quiz_id = request.GET.get('quiz_id')

    if not quiz_id:
        return JsonResponse({'error': 'Missing or empty quiz_id'}, status=400)

    try:
        quiz_id = int(quiz_id)
    except ValueError:
        return JsonResponse({'error': 'Invalid quiz_id format'}, status=400)

    # Connect to the MySQL database
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='javaquizapp'
    )
    mycursor = conn.cursor(dictionary=True)

    questions_map = {}
    json_response = []

    try:
        # Fetch questions
        mycursor.execute(
            """
            SELECT q.question_id, q.question_text, q.quiz_id, q.question_type_id, q.time, qt.type_name
            FROM question q
            JOIN question_type qt ON q.question_type_id = qt.question_type_id
            WHERE q.quiz_id = %s
            """, (quiz_id,)
        )
        questions = mycursor.fetchall()

        for question in questions:
            question_id = question['question_id']
            questions_map[question_id] = {
                'question_id': question_id,
                'question_text': question['question_text'],
                'quiz_id': question['quiz_id'],
                'type_name': question['type_name'],
                'time': question['time'],
                'options': []
            }

        # Fetch options
        mycursor.execute(
            """
            SELECT o.question_id, o.option_id, o.option_text,
                   IF(a.option_id IS NOT NULL, TRUE, FALSE) AS is_correct
            FROM option o
            LEFT JOIN answer a ON o.option_id = a.option_id AND o.question_id = a.question_id
            WHERE o.question_id IN (SELECT question_id FROM question WHERE quiz_id = %s)
            """, (quiz_id,)
        )
        options = mycursor.fetchall()

        for option in options:
            question_id = option['question_id']
            if question_id in questions_map:
                questions_map[question_id]['options'].append({
                    'option_id': option['option_id'],
                    'option_text': option['option_text'],
                    'is_correct': option['is_correct']
                })

        json_response = list(questions_map.values())
        print(json_response)

    except mysql.connector.Error as err:
        return JsonResponse({'error': f'Server error occurred: {err}'}, status=500)

    finally:
        mycursor.close()
        conn.close()

    return render(request, 'quiz.html', {'quiz_id': quiz_id})


def get_quiz_data(request):
    if 'username' not in request.session:
        return redirect('login') 
    quiz_id = request.GET.get('quiz_id')

    if not quiz_id:
        return JsonResponse({'error': 'Missing or empty quiz_id'}, status=400)

    try:
        quiz_id = int(quiz_id)
    except ValueError:
        return JsonResponse({'error': 'Invalid quiz_id format'}, status=400)

    # Connect to the MySQL database
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='javaquizapp'
    )
    mycursor = conn.cursor(dictionary=True)

    questions_map = {}
    json_response = []

    try:
        # Fetch questions
        mycursor.execute(
            """
            SELECT q.question_id, q.question_text, q.quiz_id, q.question_type_id, q.time, qt.type_name
            FROM question q
            JOIN question_type qt ON q.question_type_id = qt.question_type_id
            WHERE q.quiz_id = %s
            """, (quiz_id,)
        )
        questions = mycursor.fetchall()

        for question in questions:
            question_id = question['question_id']
            questions_map[question_id] = {
                'question_id': question_id,
                'question_text': question['question_text'],
                'quiz_id': question['quiz_id'],
                'type_name': question['type_name'],
                'time': question['time'],
                'options': []
            }

        # Fetch options
        mycursor.execute(
            """
            SELECT o.question_id, o.option_id, o.option_text,
                   IF(a.option_id IS NOT NULL, TRUE, FALSE) AS is_correct
            FROM option o
            LEFT JOIN answer a ON o.option_id = a.option_id AND o.question_id = a.question_id
            WHERE o.question_id IN (SELECT question_id FROM question WHERE quiz_id = %s)
            """, (quiz_id,)
        )
        options = mycursor.fetchall()

        for option in options:
            question_id = option['question_id']
            if question_id in questions_map:
                questions_map[question_id]['options'].append({
                    'option_id': option['option_id'],
                    'option_text': option['option_text'],
                    'is_correct': option['is_correct']
                })

        json_response = list(questions_map.values())

    except mysql.connector.Error as err:
        return JsonResponse({'error': f'Server error occurred: {err}'}, status=500)

    finally:
        mycursor.close()
        conn.close()

    return JsonResponse(json_response, safe=False)
#quiz list___________________________________________________________________________________------

def quiz_list(request):
    if 'username' not in request.session:
        return redirect('login')  # Indentation corrected here
    try:
        # Connect to the database
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='javaquizapp'
        )
        cursor = conn.cursor(dictionary=True)

        # Query to fetch quizzes along with topic details
        query = """
        SELECT t.topic_id, t.topic_name, q.quiz_id, q.quiz_name, q.difficulty
        FROM topic t
        JOIN quiz q ON q.topic_id = t.topic_id
        """
        cursor.execute(query)
        quizzes = cursor.fetchall()

        # Return data as JSON
        return JsonResponse(quizzes, safe=False)

    except mysql.connector.Error as err:
        return JsonResponse({'error': 'An error occurred while fetching data'}, status=500)

    finally:
        cursor.close()
        conn.close()


def quiz_list_page(request):
    if 'username' not in request.session:
        return redirect('login')  # Indentation corrected here
    return render(request, 'quiz_list.html')

def view_quizzes(request):
    if 'username' not in request.session:
        return redirect('login')  # Indentation corrected here
    return render(request, 'view_quizzes.html')

#admin home ____________________________________________________________________________
def adminhome(request):
    return render(request, 'adminhome.html')

def insert_topic(request):
    if request.method == 'POST':
        topic_name = request.POST.get('topic_name')

        if not topic_name:
            return HttpResponse("failure: Topic name is required")

        try:
            conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="javaquizapp"
            )
            mycursor = conn.cursor()

            query = "INSERT INTO topic (topic_name) VALUES (%s)"
            mycursor.execute(query, (topic_name,))
            conn.commit()

            return HttpResponse("success")
        except mysql.connector.Error as err:
            print("Error: ", err)
            return HttpResponse("failure: Database error occurred")
        finally:
            if conn.is_connected():
                mycursor.close()
                conn.close()
    else:
        return render(request, 'adminhome.html')
    
#Create Quiz________________________________________________________________-
def create_quiz(request):
    return render(request, 'create_quiz.html')


from django.http import JsonResponse
import mysql.connector

def get_topics(request):
    try:
        # Connect to MySQL database
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="javaquizapp"
        )
        cursor = conn.cursor()

        # Fetch all topics from the 'topic' table
        cursor.execute("SELECT topic_id, topic_name FROM topic")
        topics = cursor.fetchall()

        # Prepare a list of dictionaries to send as JSON response
        topic_list = [{"id": topic[0], "name": topic[1]} for topic in topics]

        # Return the list as JSON response
        return JsonResponse(topic_list, safe=False)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return JsonResponse({"error": "An error occurred while fetching topics."}, status=500)

    finally:
        # Close the cursor and connection
        cursor.close()
        conn.close()


from django.db import transaction



@transaction.atomic
def insert_quiz(request):
    if request.method == 'POST':
        conn = None
        cursor = None
        try:
            # Connect to MySQL database
            conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="javaquizapp"
            )
            cursor = conn.cursor()

            topic_id = request.POST.get('topic')
            quiz_name = request.POST.get('quizName')
            difficulty = request.POST.get('difficulty')

            # Insert into the quiz table
            quiz_insert_query = """INSERT INTO quiz (topic_id, quiz_name, difficulty) 
                                   VALUES (%s, %s, %s)"""
            quiz_data = (topic_id, quiz_name, difficulty)
            cursor.execute(quiz_insert_query, quiz_data)
            quiz_id = cursor.lastrowid  # Get the last inserted quiz_id

            # Handle questions and options
            question_indexes = [int(k.split('[')[1].split(']')[0]) for k in request.POST.keys() if k.startswith('questions[')]
            question_indexes = set(question_indexes)  # Unique question indexes

            for index in question_indexes:
                question_text = request.POST.get(f'questions[{index}][question]')
                question_type = request.POST.get(f'questions[{index}][questionType]')
                time_str = request.POST.get(f'questions[{index}][time]')  # Getting time field

                # Ensure time is an integer
                time = int(time_str) if time_str else 0

                # Map question type to a numeric ID (single/multiple)
                question_type_id = '1' if question_type == 'single' else '2'

                # Insert into the question table with time
                question_insert_query = """INSERT INTO question (quiz_id, question_text, question_type_id, time) 
                                           VALUES (%s, %s, %s, %s)"""
                cursor.execute(question_insert_query, (quiz_id, question_text, question_type_id, time))
                question_id = cursor.lastrowid  # Get the inserted question_id

                # Insert options and correct options
                options = request.POST.getlist(f'questions[{index}][options][]')
                correct_options = request.POST.getlist(f'questions[{index}][correctOptions][]')

                for option_text in options:
                    # Insert each option into the option table
                    option_insert_query = """INSERT INTO option (question_id, option_text) 
                                             VALUES (%s, %s)"""
                    cursor.execute(option_insert_query, (question_id, option_text))
                    option_id = cursor.lastrowid

                    # Insert into the answer table if the option is correct
                    if option_text in correct_options:
                        answer_insert_query = """INSERT INTO answer (question_id, option_id) 
                                                 VALUES (%s, %s)"""
                        cursor.execute(answer_insert_query, (question_id, option_id))

            # Commit the transaction
            conn.commit()

            # Redirect to a success page or show success in the same form
            return render(request, 'create_quiz.html', {"status": "Inserted Successfully"})

        except mysql.connector.Error as err:
            # Rollback in case of error
            if conn:
                conn.rollback()
            print(f"Error: {err}")
            return JsonResponse({"error": "An error occurred while inserting the quiz."}, status=500)

        finally:
            # Close the cursor and connection if they were opened
            if cursor:
                cursor.close()
            if conn:
                conn.close()

    return JsonResponse({"error": "Invalid request method."}, status=400)


from django.shortcuts import render
import mysql.connector
from django.http import JsonResponse

def view_quiz_by_admin(request):
    quiz_id = request.GET.get('quiz_id')  # Get quiz_id from the request query parameter
    
    if not quiz_id:
        return JsonResponse({'error': 'Quiz ID is required'}, status=400)
    
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="javaquizapp"
        )
        cursor = conn.cursor(dictionary=True)

        # Query to get all quiz questions and their corresponding options
        query = """
            SELECT 
                qq.quiz_id, qq.quiz_name, qq.question_id, qq.question_text, 
                qq.type_name, qq.time, 
                qq.option_id, qq.option_text, qq.is_correct_option
            FROM quiz_questions qq
            WHERE qq.quiz_id = %s
        """
        cursor.execute(query, (quiz_id,))
        rows = cursor.fetchall()

        if not rows:
            return JsonResponse({'error': 'No data found for the given quiz ID'}, status=404)

        # Group questions and options together
        quiz_data = {}
        for row in rows:
            question_id = row['question_id']
            if question_id not in quiz_data:
                quiz_data[question_id] = {
                    'question_id': row['question_id'],
                    'question_text': row['question_text'],
                    'type_name': row['type_name'],
                    'time': row['time'],
                    'options': [],
                }
            # Add options to the current question
            quiz_data[question_id]['options'].append({
                'option_id': row['option_id'],
                'option_text': row['option_text'],
                'is_correct_option': row['is_correct_option'],
            })

        # Convert the dictionary to a list to maintain the order of questions
        quiz_data = list(quiz_data.values())

        # Render the HTML template with quiz_data
        return render(request, 'view_quiz_by_admin.html', {'quiz_data': quiz_data})

    except mysql.connector.Error as err:
        return JsonResponse({'error': str(err)}, status=500)

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


from django.http import HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
import mysql.connector

@csrf_exempt
def update_quiz_by_admin(request, question_id):
    if request.method == 'POST':
        quiz_id = request.POST.get('quiz_id')
        question_text = request.POST.get('question_text')
        question_type_id = request.POST.get('question_type_id')
        time = request.POST.get('time')
        options = request.POST.getlist('option_id')
        option_texts = request.POST.getlist('option_text')
        correct_options = request.POST.getlist('is_correct_option')

        try:
            conn = mysql.connector.connect(
                host="localhost",
                user="root",
                password="",
                database="javaquizapp"
            )
            cursor = conn.cursor()

            # Update the question
            update_question_query = """
                UPDATE question 
                SET question_text = %s, question_type_id = %s, time = %s 
                WHERE question_id = %s
            """
            cursor.execute(update_question_query, (question_text, question_type_id, time, question_id))

            # Update the options
            for option_id, option_text, is_correct in zip(options, option_texts, correct_options):
                update_option_query = """
                    UPDATE option 
                    SET option_text = %s 
                    WHERE option_id = %s
                """
                cursor.execute(update_option_query, (option_text, option_id))

                if is_correct == 'yes':
                    # Insert or update correct answer
                    insert_answer_query = """
                        INSERT INTO answer (question_id, option_id) 
                        VALUES (%s, %s)
                        ON DUPLICATE KEY UPDATE option_id = %s
                    """
                    cursor.execute(insert_answer_query, (question_id, option_id, option_id))
                else:
                    # Delete incorrect answers
                    delete_answer_query = """
                        DELETE FROM answer 
                        WHERE question_id = %s AND option_id = %s
                    """
                    cursor.execute(delete_answer_query, (question_id, option_id))

            conn.commit()

            # Redirect with a success query parameter
            return HttpResponseRedirect(f'/view_quizzes?success=true')

        except mysql.connector.Error as err:
            return JsonResponse({'error': str(err)}, status=500)
        finally:
            cursor.close()
            conn.close()

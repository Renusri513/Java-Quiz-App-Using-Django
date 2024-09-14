from django.db import models

# Create your models here.
class user:
    user_id:int
    user_name:str
    email:str
    phone_no:str
    password:str
class Quiz:
    # Fields for the Quiz model
    quiz_name:str
    description:str 
    topic:str
    difficulty:str 
    created_at:str 
    updated_at:StopIteration 
    def __str__(self):
        return self.quiz_name 
class Question:
    question_id:int
    question_text:str
    time: str
    type_name:str
class Option:
    option_text: str
    is_correct: str

from django.urls import path

from . import views
from django.conf.urls.static import static
from  QuizApp import settings
from django.contrib.auth import views as auth_views

urlpatterns=[
    path('',views.index,name='index'),
path('index', views.index, name='index'),
path('about', views.about, name='about'),
path('login', views.login, name='login'),
path('adminlogin', views.adminlogin, name='adminlogin'),
path('signup', views.signup, name='signup'),
path('logout', views.logout, name='logout'),
path('dashboard', views.dashboard, name='dashboard'),
 path('get_dashboard_data/', views.get_dashboard_data, name='get_dashboard_data'),
path('get_quizzes_by_topic_difficulty/', views.get_quizzes_by_topic_difficulty, name='get_quizzes_by_topic_difficulty'),
path('quiz/', views.quiz, name='quiz'),
 path('get_quiz_data/', views.get_quiz_data, name='get_quiz_data'),
 
    path('quiz_list/', views.quiz_list_page, name='quiz_list'),
   
    path('api/quiz_list/', views.quiz_list, name='quiz_list_api'),
path('view_quizzes/', views.view_quizzes, name='view_quizzes'),
    path('adminhome/', views.adminhome, name='adminhome'),
     path('inserttopic/', views.insert_topic, name='inserttopic'),
     path('create_quiz/', views.create_quiz, name='create_quiz'),
     path('get_topics/', views.get_topics, name='get_topics'),
     path('insert_quiz/',views.insert_quiz, name='insert_quiz'),
   path('view_quiz_by_admin/', views.view_quiz_by_admin, name='view_quiz_by_admin'),
    path('update_quiz_by_admin/<int:question_id>/', views.update_quiz_by_admin, name='update_quiz_by_admin'),
   

      
     



]
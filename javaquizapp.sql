-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2024 at 05:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javaquizapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(5) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user_name`, `email`, `password`) VALUES
(1, 'Renusri', 'renu@gmail.com', 'Renusri@admin'),
(2, 'Rajitha', 'rajitha@gmail.com', '6e14dfa6304633f6318c0051827b2f4f2a6b477a');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(10) NOT NULL,
  `question_id` int(10) NOT NULL,
  `option_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answer_id`, `question_id`, `option_id`) VALUES
(1, 1, 2),
(2, 2, 7),
(3, 3, 10),
(4, 5, 20),
(5, 6, 22),
(6, 7, 26),
(7, 8, 30),
(8, 8, 32),
(9, 9, 34),
(10, 10, 39),
(11, 4, 16),
(12, 11, 42),
(13, 12, 46),
(14, 13, 50),
(15, 14, 53),
(16, 15, 58),
(17, 16, 61),
(18, 17, 66),
(19, 18, 69),
(20, 19, 73),
(21, 20, 75),
(22, 20, 76),
(23, 20, 77),
(24, 20, 78),
(25, 21, 80),
(26, 22, 84),
(27, 23, 87),
(28, 24, 91),
(29, 25, 96),
(30, 26, 99),
(31, 27, 104),
(32, 29, 111),
(33, 30, 116),
(34, 31, 119),
(35, 32, 123),
(36, 33, 126),
(37, 34, 130),
(38, 35, 135),
(39, 36, 137),
(40, 37, 142),
(41, 38, 146),
(42, 39, 149),
(43, 40, 153),
(44, 41, 157),
(45, 42, 163),
(46, 43, 165),
(47, 44, 171),
(48, 45, 172),
(49, 46, 177),
(50, 47, 182),
(51, 48, 184),
(52, 49, 190),
(53, 50, 193),
(54, 51, 195),
(55, 52, 200),
(56, 53, 206),
(57, 54, 208),
(58, 55, 214),
(59, 56, 215),
(60, 57, 220),
(61, 58, 225),
(62, 59, 227),
(63, 60, 233),
(64, 61, 236),
(65, 62, 238),
(66, 63, 243),
(67, 64, 246),
(68, 65, 252),
(69, 66, 254),
(70, 67, 257),
(71, 68, 261),
(72, 69, 265),
(73, 70, 268),
(74, 71, 274),
(75, 72, 276),
(76, 73, 281),
(77, 74, 284),
(78, 75, 287),
(79, 76, 291),
(80, 77, 295),
(81, 78, 299),
(82, 79, 302),
(83, 80, 306);

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE `option` (
  `option_id` int(10) NOT NULL,
  `question_id` int(10) NOT NULL,
  `option_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`option_id`, `question_id`, `option_text`) VALUES
(1, 1, ' A type of coffee'),
(2, 1, ' A programming language'),
(3, 1, 'A game'),
(4, 1, 'An operating system'),
(5, 2, '.txt'),
(6, 2, '.js'),
(7, 2, '.java'),
(8, 2, '.py'),
(9, 3, 'init()'),
(10, 3, 'main()'),
(11, 3, 'start()'),
(12, 3, 'run()'),
(13, 4, 'print(\"Hello World\")'),
(14, 4, 'printf(\"Hello World\")'),
(15, 4, 'Console.WriteLine(\"Hello World\")'),
(16, 4, 'System.out.println(\"Hello World\")'),
(17, 5, 'int'),
(18, 5, 'float'),
(19, 5, 'String'),
(20, 5, 'real'),
(21, 6, 'A value that cannot change'),
(22, 6, ' A reserved memory location to store data'),
(23, 6, ' A type of method'),
(24, 6, 'A class name'),
(25, 6, 'A temporary name of the data'),
(26, 7, 'class'),
(27, 7, 'define'),
(28, 7, 'public'),
(29, 7, 'struct'),
(30, 8, '/ This is a comment /'),
(31, 8, '# This is a comment '),
(32, 8, ' // This is a comment'),
(33, 8, ' none of the above'),
(34, 9, 'int num = 10;'),
(35, 9, 'int num := 10;'),
(36, 9, ' num int = 10;'),
(37, 9, 'integer num = 10;'),
(38, 10, 'The method or class is only accessible within the same package'),
(39, 10, 'The method or class is accessible to any other classes'),
(40, 10, 'It makes a variable constant'),
(41, 10, ' It hides the class or method'),
(42, 11, 'break'),
(43, 11, 'exit'),
(44, 11, 'continue'),
(45, 12, ' Non-positive'),
(46, 12, 'Positive'),
(47, 12, 'Error'),
(48, 12, 'No output'),
(49, 13, 'break'),
(50, 13, 'continue'),
(51, 13, 'return'),
(52, 14, 'if x > 10'),
(53, 14, ' if (x > 10)'),
(54, 14, 'if {x > 10}'),
(55, 14, ' if x > 10 {}'),
(56, 15, ' It will exit the loop'),
(57, 15, ' It will cause a compilation error'),
(58, 15, 'The next case will also execute'),
(59, 15, 'It will return to the main method'),
(60, 16, 'A'),
(61, 16, 'B'),
(62, 16, 'No output'),
(63, 16, 'Compilation error'),
(64, 17, 'int'),
(65, 17, 'String'),
(66, 17, 'float'),
(67, 17, 'char'),
(68, 18, 'continue'),
(69, 18, 'break'),
(70, 18, 'return'),
(71, 18, 'exit'),
(72, 19, 'It is an entry-controlled loop'),
(73, 19, 'It is always executed at least once'),
(74, 19, 'It is similar to a for loop without an initialization step'),
(75, 20, ' Use break inside the innermost loop'),
(76, 20, 'Use labeled break statements'),
(77, 20, 'Use return inside the innermost loop'),
(78, 20, 'none of the above'),
(79, 21, 'The finally block will be skipped'),
(80, 21, 'The finally block will always execute'),
(81, 21, 'The program will crash'),
(82, 21, 'The break statement will be ignored'),
(83, 22, '21'),
(84, 22, '11'),
(85, 22, '16'),
(86, 23, '='),
(87, 23, '=='),
(88, 23, '!='),
(89, 23, '&&'),
(90, 24, '0'),
(91, 24, '1'),
(92, 24, '2'),
(93, 24, '3'),
(94, 25, 'Increments a value by 2'),
(95, 25, 'Decrements a value by 1'),
(96, 25, 'Increments a value by 1'),
(97, 25, 'None of the above'),
(98, 26, 'true'),
(99, 26, 'false'),
(100, 26, 'null'),
(101, 26, '1'),
(102, 27, '30'),
(103, 27, '60'),
(104, 27, '3'),
(105, 27, '7'),
(106, 28, 'String s = \"Hello\";'),
(107, 28, 'String s = \'Hello\';'),
(108, 28, 'String s = Hello;'),
(109, 28, 'string s = \"Hello\";'),
(110, 29, '4'),
(111, 29, '5'),
(112, 29, '6'),
(113, 29, '0'),
(114, 30, 'compareTo()'),
(115, 30, 'equalsIgnoreCase()'),
(116, 30, 'equals()'),
(117, 30, 'compare()'),
(118, 31, 'substring()'),
(119, 31, 'subString()'),
(120, 31, 'substr()'),
(121, 31, 'getSubString()'),
(122, 32, 'String is mutable.'),
(123, 32, 'String is immutable.'),
(124, 32, 'String can only store numeric data.'),
(125, 32, 'String cannot be initialized using double quotes.'),
(126, 33, 'A single variable that holds multiple values'),
(127, 33, 'A function that returns multiple values'),
(128, 33, 'A class that stores data'),
(129, 34, 'int array[5];'),
(130, 34, 'int[] array = new int[5];'),
(131, 34, 'array int = new int[5];'),
(132, 34, 'int array = [5];'),
(133, 35, '1'),
(134, 35, '-1'),
(135, 35, '0'),
(136, 35, 'null'),
(137, 36, 'array[2]'),
(138, 36, 'array(2)'),
(139, 36, 'array{2}'),
(140, 37, 'It returns null'),
(141, 37, 'It returns 0'),
(142, 37, 'It throws an ArrayIndexOutOfBoundsException'),
(143, 37, 'It loops back to the first element'),
(144, 38, '3'),
(145, 38, '4'),
(146, 38, '5'),
(147, 38, '6'),
(148, 39, 'array.length()'),
(149, 39, 'array.length'),
(150, 39, 'array.size()'),
(151, 39, 'array.count()'),
(152, 40, 'int[] array = new int[5];'),
(153, 40, 'int[] array = {1, 2, 3, 4, 5};'),
(154, 40, 'int array[] = [1, 2, 3, 4, 5];'),
(155, 40, 'array int[] = {1, 2, 3, 4, 5};'),
(156, 41, 'Only integer arrays'),
(157, 41, 'Arrays of any primitive type or object'),
(158, 41, 'Only character arrays'),
(159, 41, 'Only boolean arrays'),
(160, 42, 'Inheritance'),
(161, 42, 'Polymorphism'),
(162, 42, 'Encapsulation'),
(163, 42, 'Compilation'),
(164, 43, ' Object-Only Programming'),
(165, 43, 'Object-Oriented Programming'),
(166, 43, 'Oriented Object Programming'),
(167, 43, 'Object Operational Programming'),
(168, 44, 'Inheritance'),
(169, 44, 'Polymorphism'),
(170, 44, 'Encapsulation'),
(171, 44, 'Compilation'),
(172, 45, 'A blueprint for creating objects'),
(173, 45, 'A type of variable'),
(174, 45, 'A function'),
(175, 45, 'A condition in Java'),
(176, 46, 'class'),
(177, 46, 'new'),
(178, 46, 'static'),
(179, 46, 'void'),
(180, 47, 'Inheritance'),
(181, 47, 'Polymorphism'),
(182, 47, 'Abstraction'),
(183, 47, 'Encapsulation'),
(184, 48, 'When a class acquires properties and behaviors of another class'),
(185, 48, 'When a class implements multiple interfaces'),
(186, 48, ' When a method has the same name as another'),
(187, 48, 'When two classes are declared with the same name'),
(188, 49, 'Encapsulation'),
(189, 49, ' Overloading'),
(190, 49, 'Overriding'),
(191, 49, 'Inheritance'),
(192, 50, ' The ability of a variable to hold multiple data types'),
(193, 50, 'The ability of a class to have multiple methods with the same name but different parameters'),
(194, 50, 'The process of hiding internal details of a class'),
(195, 51, 'Wrapping data and methods together into a single unit'),
(196, 51, 'The ability to define multiple methods in a class with the same name'),
(197, 51, 'The inheritance of methods from a parent class'),
(198, 51, ' Declaring methods in a subclass with the same name as in the superclass'),
(199, 52, 'public'),
(200, 52, 'private'),
(201, 52, 'protected'),
(202, 52, 'default'),
(203, 53, 'Inheritance'),
(204, 53, 'Polymorphism'),
(205, 53, 'Encapsulation'),
(206, 53, 'Compilation'),
(207, 54, ' Object-Only Programming'),
(208, 54, 'Object-Oriented Programming'),
(209, 54, 'Oriented Object Programming'),
(210, 54, 'Object Operational Programming'),
(211, 55, 'Inheritance'),
(212, 55, 'Polymorphism'),
(213, 55, 'Encapsulation'),
(214, 55, 'Compilation'),
(215, 56, 'A blueprint for creating objects'),
(216, 56, 'A type of variable'),
(217, 56, 'A function'),
(218, 56, 'A condition in Java'),
(219, 57, 'class'),
(220, 57, 'new'),
(221, 57, 'static'),
(222, 57, 'void'),
(223, 58, 'Inheritance'),
(224, 58, 'Polymorphism'),
(225, 58, 'Abstraction'),
(226, 58, 'Encapsulation'),
(227, 59, 'When a class acquires properties and behaviors of another class'),
(228, 59, 'When a class implements multiple interfaces'),
(229, 59, ' When a method has the same name as another'),
(230, 59, 'When two classes are declared with the same name'),
(231, 60, 'Encapsulation'),
(232, 60, ' Overloading'),
(233, 60, 'Overriding'),
(234, 60, 'Inheritance'),
(235, 61, ' The ability of a variable to hold multiple data types'),
(236, 61, 'The ability of a class to have multiple methods with the same name but different parameters'),
(237, 61, 'The process of hiding internal details of a class'),
(238, 62, 'Wrapping data and methods together into a single unit'),
(239, 62, 'The ability to define multiple methods in a class with the same name'),
(240, 62, 'The inheritance of methods from a parent class'),
(241, 62, ' Declaring methods in a subclass with the same name as in the superclass'),
(242, 63, 'public'),
(243, 63, 'private'),
(244, 63, 'protected'),
(245, 63, 'default'),
(246, 64, 'A way to create new classes from existing classes'),
(247, 64, 'A way to duplicate classes'),
(248, 64, 'A way to protect data in a class'),
(249, 64, 'A method to override functionality'),
(250, 65, 'extend'),
(251, 65, 'inherit'),
(252, 65, 'extends'),
(253, 66, 'A class that cannot be extended'),
(254, 66, 'A class that is inherited by another class'),
(255, 66, 'A class that has no constructor'),
(256, 67, 'Override its parent class without modifying it'),
(257, 67, 'Use the properties and methods of another class'),
(258, 67, 'Write multiple constructors for a class'),
(259, 67, ' Create objects without using the new keyword'),
(260, 68, 'A class that cannot be instantiated'),
(261, 68, 'A class that inherits from another class'),
(262, 68, 'A class that extends the functionality of an interface'),
(263, 68, 'A class that is final'),
(264, 69, ' You can override a private method'),
(265, 69, ' A subclass can change the behavior of a method defined in its superclass'),
(266, 69, ' Overriding is allowed only if the method has the same name but different parameters'),
(267, 69, 'Overriding is not allowed for constructors'),
(268, 70, 'The process of hiding implementation details and showing only the functionality'),
(269, 70, 'The ability to create multiple methods with the same name'),
(270, 70, ' The process of extending one class from another'),
(271, 70, 'The ability to inherit properties from multiple classes'),
(272, 71, ' Methods only'),
(273, 71, 'Classes only'),
(274, 71, 'Methods and classes'),
(275, 71, 'Variables only'),
(276, 72, 'abstract'),
(277, 72, 'interface'),
(278, 72, 'class'),
(279, 72, 'implements'),
(280, 73, 'yes'),
(281, 73, 'no'),
(282, 74, 'It must override all methods of the abstract class'),
(283, 74, 'It must not have any abstract methods'),
(284, 74, 'It must implement all abstract methods from the abstract class'),
(285, 74, 'It must also be declared abstract'),
(286, 75, 'No, abstract classes cannot have constructors'),
(287, 75, 'Yes, abstract classes can have constructors'),
(288, 75, 'Only static constructors are allowed in abstract classes'),
(289, 75, 'Constructors in abstract classes must be private'),
(290, 76, 'The ability to create multiple objects from a single class'),
(291, 76, 'The ability to use a single action in different forms'),
(292, 76, 'The ability to define multiple constructors in a class'),
(293, 76, 'The ability to override methods in a class'),
(294, 77, 'Method Overloading'),
(295, 77, ' Method Overriding'),
(296, 77, 'Abstract Classes'),
(297, 77, 'Interface Implementation'),
(298, 78, 'Method Overloading'),
(299, 78, 'Method Overriding'),
(300, 78, 'Operator Overloading'),
(301, 78, 'Multiple Inheritance'),
(302, 79, 'Defining multiple methods in a class with the same name but different parameters'),
(303, 79, ' Defining multiple methods in different classes with the same name'),
(304, 79, ' Overriding a method in a subclass'),
(305, 79, 'Implementing multiple interfaces in a class'),
(306, 80, 'Defining a method in a subclass with the same name and parameters as in its superclass'),
(307, 80, 'Changing the method name in a subclass'),
(308, 80, 'Overloading a method with a different return type'),
(309, 80, 'Declaring methods with different access modifiers');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(10) NOT NULL,
  `quiz_id` int(10) NOT NULL,
  `question_text` text NOT NULL,
  `question_type_id` int(10) NOT NULL,
  `Time` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `quiz_id`, `question_text`, `question_type_id`, `Time`) VALUES
(1, 1, 'What is Java?', 1, 20),
(2, 1, 'What is the correct extension of a Java file?', 1, 20),
(3, 1, 'Which method is the entry point for a Java program?', 1, 25),
(4, 1, 'How do you print text to the console in Java?', 1, 20),
(5, 1, 'Which of the following is not a data type in Java?', 1, 20),
(6, 1, 'What is a variable in Java?', 1, 25),
(7, 1, 'Which keyword is used to define a class in Java?', 1, 20),
(8, 1, 'Which of the following is a valid comment in Java?', 2, 25),
(9, 1, 'Which of the following is the correct way to declare an integer variable in Java?', 1, 35),
(10, 1, 'What does the \'public\' keyword mean in Java?', 1, 25),
(11, 2, 'Which of the following is used to terminate a switch statement in Java?', 1, 25),
(12, 2, 'What will the following code print? int x = 5; if (x > 0) {     System.out.println(\"Positive\"); } else {     System.out.println(\"Non-positive\"); }', 1, 45),
(13, 2, 'Which keyword is used to skip the current iteration in a loop and move to the next iteration?', 1, 25),
(14, 2, 'What is the correct syntax for an if statement in Java?', 1, 25),
(15, 2, 'What will happen if the break statement is omitted in a switch case?', 1, 35),
(16, 3, 'What will be the output of the following code?                                                int x = 5; int y = 10; if (x > y)     if (x == 5)         System.out.println(\"A\"); else     System.out.println(\"B\");', 1, 35),
(17, 3, 'In a switch statement, which data types are not supported as a case expression in Java?', 1, 40),
(18, 3, ' How can you exit a loop without waiting for the condition to become false?', 1, 40),
(19, 3, 'Which of the following is true about the do-while loop in Java?', 1, 25),
(20, 3, 'How can you break out of multiple nested loops in Java?', 2, 35),
(21, 3, 'What happens if you call break in a try block when a finally block is also present?', 1, 40),
(22, 4, 'Which of the following is the correct output of the expression 5 + 2 * 3 in Java?', 1, 30),
(23, 4, 'Which operator is used to compare two values for equality in Java?', 1, 35),
(24, 4, 'What will be the result of the following expression in Java: 10 % 3?', 1, 30),
(25, 4, 'What does the ++ operator do in Java?', 1, 35),
(26, 4, 'Which of the following is the correct result of the expression true && false in Java?', 1, 25),
(27, 4, 'What will be the result of the following expression: 15 >> 2?', 1, 30),
(28, 5, 'Which of the following is a correct way to declare a string in Java?', 1, 30),
(29, 5, 'What will be the output of the following code? String s = \"Hello\"; System.out.println(s.length());', 1, 35),
(30, 5, 'Which method is used to compare two strings in Java, considering case sensitivity?', 1, 35),
(31, 5, 'Which of the following methods is used to get a substring in Java?', 1, 25),
(32, 5, 'Which of the following statements is true about the String class in Java?', 1, 35),
(33, 6, 'What is an array in Java?', 1, 35),
(34, 6, 'How do you declare an array of integers in Java?', 1, 35),
(35, 6, 'What is the default value of elements in an integer array in Java?', 1, 35),
(36, 6, 'How can you access the third element of an array in Java?', 1, 25),
(37, 6, 'What happens if you try to access an index that is out of bounds in an array?', 1, 35),
(38, 6, 'What is the length of the following array? int[] array = {1, 2, 3, 4, 5};', 1, 30),
(39, 6, 'How do you find the length of an array in Java?', 1, 30),
(40, 6, 'How do you initialize an array with specific values?', 1, 30),
(41, 6, 'What type of array can you create in Java?', 1, 25),
(42, 7, 'Which of the following is not a fundamental concept of OOP in Java?', 1, 35),
(43, 7, 'What does OOP stand for?', 1, 35),
(44, 7, 'Which of the following is NOT a feature of OOP?', 1, 35),
(45, 7, 'What is a class in Java?', 1, 35),
(46, 7, 'Which keyword is used to create an object in Java?', 1, 35),
(47, 7, 'What is the process of hiding internal implementation details and showing only functionality called?', 1, 35),
(48, 7, 'What is inheritance in Java?', 1, 35),
(49, 7, 'Which concept allows a subclass to provide a specific implementation of a method that is already defined in its superclass?', 1, 35),
(50, 7, 'What is polymorphism in Java?', 1, 35),
(51, 7, 'What is encapsulation?', 1, 30),
(52, 7, 'Which access modifier makes a class member accessible only within its own class?', 1, 35),
(53, 8, 'Which of the following is not a fundamental concept of OOP in Java?', 1, 35),
(54, 8, 'What does OOP stand for?', 1, 35),
(55, 8, 'Which of the following is NOT a feature of OOP?', 1, 35),
(56, 8, 'What is a class in Java?', 1, 35),
(57, 8, 'Which keyword is used to create an object in Java?', 1, 35),
(58, 8, 'What is the process of hiding internal implementation details and showing only functionality called?', 1, 35),
(59, 8, 'What is inheritance in Java?', 1, 35),
(60, 8, 'Which concept allows a subclass to provide a specific implementation of a method that is already defined in its superclass?', 1, 35),
(61, 8, 'What is polymorphism in Java?', 1, 35),
(62, 8, 'What is encapsulation?', 1, 30),
(63, 8, 'Which access modifier makes a class member accessible only within its own class?', 1, 35),
(64, 9, 'What is inheritance in Java?', 1, 35),
(65, 9, 'Which keyword is used to inherit a class in Java?', 1, 30),
(66, 9, 'What is a superclass in Java?', 1, 25),
(67, 9, 'Inheritance in Java allows one class to:', 1, 35),
(68, 9, 'What is a subclass in Java?', 1, 25),
(69, 9, 'Which of the following is true about method overriding in Java?', 1, 40),
(70, 10, 'What is abstraction in Java?', 1, 40),
(71, 10, 'Which of the following can be abstract in Java?', 1, 40),
(72, 10, 'What keyword is used to declare an abstract class in Java?', 1, 40),
(73, 10, ' Can an abstract class be instantiated in Java?', 1, 30),
(74, 10, 'What must a subclass do if it extends an abstract class?', 1, 35),
(75, 10, 'Can an abstract class have constructors?', 1, 40),
(76, 11, 'What is polymorphism in Java?', 1, 35),
(77, 11, 'Which of the following is an example of compile-time polymorphism?', 1, 35),
(78, 11, 'Which of the following is an example of runtime polymorphism?', 1, 40),
(79, 11, 'What is method overloading?', 1, 35),
(80, 11, 'What is method overriding?', 1, 35);

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE `question_type` (
  `question_type_id` int(10) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_type`
--

INSERT INTO `question_type` (`question_type_id`, `type_name`) VALUES
(1, 'single selection'),
(2, 'multi selection');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(10) NOT NULL,
  `topic_id` int(10) NOT NULL,
  `quiz_name` varchar(50) NOT NULL,
  `difficulty` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `topic_id`, `quiz_name`, `difficulty`) VALUES
(1, 1, 'Basic Java Quiz', 'beginner'),
(2, 2, 'Flow Control Quiz-1', 'beginner'),
(3, 2, 'Flow Control Quiz-2', 'intermediate'),
(4, 3, 'Quiz on Operators-1', 'beginner'),
(5, 4, 'Java Strings Quiz-1', 'beginner'),
(6, 5, 'Java Arrays Quiz-1', 'beginner'),
(7, 6, 'Quiz on Java OOPS', 'beginner'),
(8, 6, 'Quiz on Java OOPS', 'Intermediate'),
(9, 7, 'Java Inheritance Quiz-1', 'beginner'),
(10, 8, 'Java Abstraction Quiz-1', 'intermediate'),
(11, 9, 'Java Polymorphism', 'beginner');

-- --------------------------------------------------------

--
-- Stand-in structure for view `quiz_questions`
-- (See below for the actual view)
--
CREATE TABLE `quiz_questions` (
`quiz_id` int(10)
,`quiz_name` varchar(50)
,`question_id` int(10)
,`question_text` text
,`question_type_id` int(10)
,`type_name` varchar(50)
,`time` int(20)
,`option_id` int(10)
,`option_text` varchar(255)
,`is_correct_option` varchar(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(5) NOT NULL,
  `topic_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name`) VALUES
(1, 'Basics of Java'),
(2, 'Flow Control in Java'),
(3, 'Operators in Java'),
(4, 'Strings in Java'),
(5, 'Arraya in Java'),
(6, 'OOPS in Java'),
(7, 'Inheritance in Java'),
(8, 'Abstraction in Java'),
(9, 'Polymorphism in Java'),
(10, 'Encapsulation in Java'),
(11, 'Methods in Java'),
(12, 'Constructors in Java'),
(13, 'Interfaces in Java');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `email`, `password`, `phone_no`) VALUES
(1, 'RenuSri', 'berenusri@gmail.com', 'Renusri@1', '9080706754'),
(2, 'Sandhya', 'rajitha@gmail.com', 'e4575cafb2d6036f91e4960e386bb7d248dc0a16', '9080706754'),
(3, 'shreya', 'ahtpn4639g@gmail.com', '1953f5c77c623c0d552ec79bc59fc481e30bc554', '9090897891'),
(4, 'Renu', 'berenusrii@gmail.com', '499922788b35e72c24b6d42207f9a9713ef0b3f4', '7013577674'),
(5, 'Rajitha', 'Rajithaa@gmail.com', 'becf70dc487d35c59fad21b894cf3bd763bf5334', '8585459696'),
(6, 'Shreya', 'shreya@gmail.com', 'shreya@123', '6786786789'),
(7, 'B.Renusri', 'berenusri@gmail.com', 'Renusri@513', '9080706753');

-- --------------------------------------------------------

--
-- Structure for view `quiz_questions`
--
DROP TABLE IF EXISTS `quiz_questions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `quiz_questions`  AS SELECT `q`.`quiz_id` AS `quiz_id`, `q`.`quiz_name` AS `quiz_name`, `qs`.`question_id` AS `question_id`, `qs`.`question_text` AS `question_text`, `qs`.`question_type_id` AS `question_type_id`, `qt`.`type_name` AS `type_name`, `qs`.`Time` AS `time`, `o`.`option_id` AS `option_id`, `o`.`option_text` AS `option_text`, CASE WHEN `a`.`option_id` is not null THEN 'Yes' ELSE 'No' END AS `is_correct_option` FROM ((((`quiz` `q` join `question` `qs` on(`q`.`quiz_id` = `qs`.`quiz_id`)) join `question_type` `qt` on(`qs`.`question_type_id` = `qt`.`question_type_id`)) join `option` `o` on(`qs`.`question_id` = `o`.`question_id`)) left join `answer` `a` on(`o`.`option_id` = `a`.`option_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `question_type_id` (`question_type_id`);

--
-- Indexes for table `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`question_type_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `option`
--
ALTER TABLE `option`
  MODIFY `option_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `question_type`
--
ALTER TABLE `question_type`
  MODIFY `question_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `option` (`option_id`);

--
-- Constraints for table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `option_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

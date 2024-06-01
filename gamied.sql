-- Insert data into existing tables
START TRANSACTION;
-- Insert courses
INSERT INTO courses_course (title, description, thumbnail) VALUES
('Python Programming', 'A comprehensive course on Python programming.', NULL);

-- Insert lessons
INSERT INTO courses_lesson (title, course_id) VALUES
('Introduction to Python', (SELECT id FROM courses_course WHERE title='Python Programming' LIMIT 1)),
('Data Types and Variables', (SELECT id FROM courses_course WHERE title='Python Programming' LIMIT 1)),
('Control Structures', (SELECT id FROM courses_course WHERE title='Python Programming' LIMIT 1)),
('Functions and Modules', (SELECT id FROM courses_course WHERE title='Python Programming' LIMIT 1)),
('Working with Files', (SELECT id FROM courses_course WHERE title='Python Programming' LIMIT 1));

-- Insert content links
INSERT INTO courses_contentlink (lesson_id, title, href) VALUES
((SELECT id FROM courses_lesson WHERE title='Introduction to Python' LIMIT 1), 'Python - Official Website', 'https://www.python.org/'),
((SELECT id FROM courses_lesson WHERE title='Introduction to Python' LIMIT 1), 'Python - Wikipedia', 'https://en.wikipedia.org/wiki/Python_(programming_language)'),
((SELECT id FROM courses_lesson WHERE title='Introduction to Python' LIMIT 1), 'Python Tutorial - W3Schools', 'https://www.w3schools.com/python/'),

((SELECT id FROM courses_lesson WHERE title='Data Types and Variables' LIMIT 1), 'Python Data Types - W3Schools', 'https://www.w3schools.com/python/python_datatypes.asp'),
((SELECT id FROM courses_lesson WHERE title='Data Types and Variables' LIMIT 1), 'Python Variables - Real Python', 'https://realpython.com/python-variables/'),
((SELECT id FROM courses_lesson WHERE title='Data Types and Variables' LIMIT 1), 'Python Variables - GeeksforGeeks', 'https://www.geeksforgeeks.org/python-variables/'),

((SELECT id FROM courses_lesson WHERE title='Control Structures' LIMIT 1), 'Python Conditions - W3Schools', 'https://www.w3schools.com/python/python_conditions.asp'),
((SELECT id FROM courses_lesson WHERE title='Control Structures' LIMIT 1), 'Python Control Flow - Real Python', 'https://realpython.com/python-conditional-statements/'),
((SELECT id FROM courses_lesson WHERE title='Control Structures' LIMIT 1), 'Python Control Flow - GeeksforGeeks', 'https://www.geeksforgeeks.org/decision-making-python/'),

((SELECT id FROM courses_lesson WHERE title='Functions and Modules' LIMIT 1), 'Python Functions - W3Schools', 'https://www.w3schools.com/python/python_functions.asp'),
((SELECT id FROM courses_lesson WHERE title='Functions and Modules' LIMIT 1), 'Python Functions - Real Python', 'https://realpython.com/defining-your-own-python-function/'),
((SELECT id FROM courses_lesson WHERE title='Functions and Modules' LIMIT 1), 'Python Modules - GeeksforGeeks', 'https://www.geeksforgeeks.org/python-modules/'),

((SELECT id FROM courses_lesson WHERE title='Working with Files' LIMIT 1), 'Python File Handling - W3Schools', 'https://www.w3schools.com/python/python_file_handling.asp'),
((SELECT id FROM courses_lesson WHERE title='Working with Files' LIMIT 1), 'Real Python - Reading and Writing Files', 'https://realpython.com/read-write-files-python/'),
((SELECT id FROM courses_lesson WHERE title='Working with Files' LIMIT 1), 'GeeksforGeeks - File Handling in Python', 'https://www.geeksforgeeks.org/file-handling-python/');

-- Insert assessments (Quizzes for each lesson)
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Introduction to Python Quiz', 'quiz', 70, 'Quiz on Introduction to Python', NULL, (SELECT id FROM courses_lesson WHERE title='Introduction to Python' LIMIT 1), 30),
('Data Types and Variables Quiz', 'quiz', 70, 'Quiz on Data Types and Variables', NULL, (SELECT id FROM courses_lesson WHERE title='Data Types and Variables' LIMIT 1), 30),
('Control Structures Quiz', 'quiz', 70, 'Quiz on Control Structures', NULL, (SELECT id FROM courses_lesson WHERE title='Control Structures' LIMIT 1), 30),
('Functions and Modules Quiz', 'quiz', 70, 'Quiz on Functions and Modules', NULL, (SELECT id FROM courses_lesson WHERE title='Functions and Modules' LIMIT 1), 30),
('Working with Files Quiz', 'quiz', 70, 'Quiz on Working with Files', NULL, (SELECT id FROM courses_lesson WHERE title='Working with Files' LIMIT 1), 30);

-- Insert questions and answers for each quiz

-- Introduction to Python Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'What is Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'Which company developed Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'Which of the following is a correct variable assignment in Python?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'Which symbol is used for comments in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'How do you print "Hello, World!" in Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'Which of the following is a keyword in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'What is the correct file extension for Python files?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'Which function is used to get the length of a list in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'How do you insert comments in Python code?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Python Quiz' LIMIT 1), 'Which method is used to convert a string to lowercase in Python?', 40);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is Python?' LIMIT 1), 'A type of snake', FALSE),
((SELECT id FROM assessments_question WHERE name='What is Python?' LIMIT 1), 'A programming language', TRUE),
((SELECT id FROM assessments_question WHERE name='What is Python?' LIMIT 1), 'A software application', FALSE),
((SELECT id FROM assessments_question WHERE name='What is Python?' LIMIT 1), 'A web browser', FALSE),

((SELECT id FROM assessments_question WHERE name='Which company developed Python?' LIMIT 1), 'Microsoft', FALSE),
((SELECT id FROM assessments_question WHERE name='Which company developed Python?' LIMIT 1), 'Google', FALSE),
((SELECT id FROM assessments_question WHERE name='Which company developed Python?' LIMIT 1), 'Sun Microsystems', FALSE),
((SELECT id FROM assessments_question WHERE name='Which company developed Python?' LIMIT 1), 'Guido van Rossum', TRUE),

((SELECT id FROM assessments_question WHERE name='Which of the following is a correct variable assignment in Python?' LIMIT 1), 'var := 5', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a correct variable assignment in Python?' LIMIT 1), 'int var = 5', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a correct variable assignment in Python?' LIMIT 1), 'var = 5', TRUE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a correct variable assignment in Python?' LIMIT 1), '5 = var', FALSE),

((SELECT id FROM assessments_question WHERE name='Which symbol is used for comments in Python?' LIMIT 1), '//', FALSE),
((SELECT id FROM assessments_question WHERE name='Which symbol is used for comments in Python?' LIMIT 1), '#', TRUE),
((SELECT id FROM assessments_question WHERE name='Which symbol is used for comments in Python?' LIMIT 1), '<!-- -->', FALSE),
((SELECT id FROM assessments_question WHERE name='Which symbol is used for comments in Python?' LIMIT 1), '/* */', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you print "Hello, World!" in Python?' LIMIT 1), 'echo "Hello, World!"', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you print "Hello, World!" in Python?' LIMIT 1), 'print("Hello, World!")', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you print "Hello, World!" in Python?' LIMIT 1), 'System.out.println("Hello, World!")', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you print "Hello, World!" in Python?' LIMIT 1), 'printf("Hello, World!")', FALSE),

((SELECT id FROM assessments_question WHERE name='Which of the following is a keyword in Python?' LIMIT 1), 'function', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a keyword in Python?' LIMIT 1), 'define', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a keyword in Python?' LIMIT 1), 'def', TRUE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a keyword in Python?' LIMIT 1), 'func', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the correct file extension for Python files?' LIMIT 1), '.pyt', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the correct file extension for Python files?' LIMIT 1), '.pt', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the correct file extension for Python files?' LIMIT 1), '.py', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the correct file extension for Python files?' LIMIT 1), '.p', FALSE),

((SELECT id FROM assessments_question WHERE name='Which function is used to get the length of a list in Python?' LIMIT 1), 'size()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which function is used to get the length of a list in Python?' LIMIT 1), 'length()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which function is used to get the length of a list in Python?' LIMIT 1), 'len()', TRUE),
((SELECT id FROM assessments_question WHERE name='Which function is used to get the length of a list in Python?' LIMIT 1), 'count()', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you insert comments in Python code?' LIMIT 1), '# This is a comment', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you insert comments in Python code?' LIMIT 1), '// This is a comment', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you insert comments in Python code?' LIMIT 1), '/* This is a comment */', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you insert comments in Python code?' LIMIT 1), '<!-- This is a comment -->', FALSE),

((SELECT id FROM assessments_question WHERE name='Which method is used to convert a string to lowercase in Python?' LIMIT 1), 'toLowerCase()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which method is used to convert a string to lowercase in Python?' LIMIT 1), 'tolower()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which method is used to convert a string to lowercase in Python?' LIMIT 1), 'lower()', TRUE),
((SELECT id FROM assessments_question WHERE name='Which method is used to convert a string to lowercase in Python?' LIMIT 1), 'lowercase()', FALSE);

-- Data Types and Variables Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Data Types and Variables Quiz' LIMIT 1), 'Which of the following is a mutable data type in Python?', 60),
((SELECT id FROM assessments_assessment WHERE title='Data Types and Variables Quiz' LIMIT 1), 'What is the correct syntax to create a dictionary in Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Data Types and Variables Quiz' LIMIT 1), 'Which data type is used to store true/false values in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Data Types and Variables Quiz' LIMIT 1), 'How do you create a variable with the floating number 2.8?', 80),
((SELECT id FROM assessments_assessment WHERE title='Data Types and Variables Quiz' LIMIT 1), 'Which method can be used to remove whitespace from the beginning or end of a string?', 60);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which of the following is a mutable data type in Python?' LIMIT 1), 'tuple', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a mutable data type in Python?' LIMIT 1), 'list', TRUE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a mutable data type in Python?' LIMIT 1), 'str', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a mutable data type in Python?' LIMIT 1), 'int', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the correct syntax to create a dictionary in Python?' LIMIT 1), 'mydict = [1, 2, 3]', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the correct syntax to create a dictionary in Python?' LIMIT 1), 'mydict = (1, 2, 3)', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the correct syntax to create a dictionary in Python?' LIMIT 1), 'mydict = {"key": "value"}', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the correct syntax to create a dictionary in Python?' LIMIT 1), 'mydict = "key": "value"', FALSE),

((SELECT id FROM assessments_question WHERE name='Which data type is used to store true/false values in Python?' LIMIT 1), 'str', FALSE),
((SELECT id FROM assessments_question WHERE name='Which data type is used to store true/false values in Python?' LIMIT 1), 'bool', TRUE),
((SELECT id FROM assessments_question WHERE name='Which data type is used to store true/false values in Python?' LIMIT 1), 'int', FALSE),
((SELECT id FROM assessments_question WHERE name='Which data type is used to store true/false values in Python?' LIMIT 1), 'float', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you create a variable with the floating number 2.8?' LIMIT 1), 'x = 2.8', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a variable with the floating number 2.8?' LIMIT 1), 'x = "2.8"', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a variable with the floating number 2.8?' LIMIT 1), 'x = (2.8)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a variable with the floating number 2.8?' LIMIT 1), 'x = [2.8]', FALSE),

((SELECT id FROM assessments_question WHERE name='Which method can be used to remove whitespace from the beginning or end of a string?' LIMIT 1), 'strip()', TRUE),
((SELECT id FROM assessments_question WHERE name='Which method can be used to remove whitespace from the beginning or end of a string?' LIMIT 1), 'trim()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which method can be used to remove whitespace from the beginning or end of a string?' LIMIT 1), 'len()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which method can be used to remove whitespace from the beginning or end of a string?' LIMIT 1), 'replace()', FALSE);

-- Control Structures Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Control Structures Quiz' LIMIT 1), 'Which keyword is used to start a loop in Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Control Structures Quiz' LIMIT 1), 'How do you write an if statement in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Control Structures Quiz' LIMIT 1), 'Which keyword is used to skip the current iteration in a loop?', 60),
((SELECT id FROM assessments_assessment WHERE title='Control Structures Quiz' LIMIT 1), 'What is the output of the following code: for i in range(3): print(i)?', 80),
((SELECT id FROM assessments_assessment WHERE title='Control Structures Quiz' LIMIT 1), 'How do you check for equality in an if statement?', 20);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which keyword is used to start a loop in Python?' LIMIT 1), 'while', TRUE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to start a loop in Python?' LIMIT 1), 'if', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to start a loop in Python?' LIMIT 1), 'elif', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to start a loop in Python?' LIMIT 1), 'for', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you write an if statement in Python?' LIMIT 1), 'if (x > 0) then:', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you write an if statement in Python?' LIMIT 1), 'if x > 0:', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you write an if statement in Python?' LIMIT 1), 'if x > 0 then:', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you write an if statement in Python?' LIMIT 1), 'if (x > 0):', FALSE),

((SELECT id FROM assessments_question WHERE name='Which keyword is used to skip the current iteration in a loop?' LIMIT 1), 'break', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to skip the current iteration in a loop?' LIMIT 1), 'skip', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to skip the current iteration in a loop?' LIMIT 1), 'continue', TRUE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to skip the current iteration in a loop?' LIMIT 1), 'pass', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the output of the following code: for i in range(3): print(i)?' LIMIT 1), '1 2 3', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the output of the following code: for i in range(3): print(i)?' LIMIT 1), '0 1 2', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the output of the following code: for i in range(3): print(i)?' LIMIT 1), '0 1 2 3', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the output of the following code: for i in range(3): print(i)?' LIMIT 1), '1 2 3 4', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you check for equality in an if statement?' LIMIT 1), 'x = y', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you check for equality in an if statement?' LIMIT 1), 'x == y', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you check for equality in an if statement?' LIMIT 1), 'x != y', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you check for equality in an if statement?' LIMIT 1), 'x equals y', FALSE);

-- Functions and Modules Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Functions and Modules Quiz' LIMIT 1), 'Which keyword is used to define a function in Python?', 60),
((SELECT id FROM assessments_assessment WHERE title='Functions and Modules Quiz' LIMIT 1), 'How do you call a function named "myFunction" in Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Functions and Modules Quiz' LIMIT 1), 'Which statement is used to end a function and return a value?', 40),
((SELECT id FROM assessments_assessment WHERE title='Functions and Modules Quiz' LIMIT 1), 'How do you import a module named "math" in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Functions and Modules Quiz' LIMIT 1), 'What is the purpose of the "import" statement in Python?', 60);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a function in Python?' LIMIT 1), 'func', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a function in Python?' LIMIT 1), 'define', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a function in Python?' LIMIT 1), 'function', TRUE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a function in Python?' LIMIT 1), 'def', TRUE),

((SELECT id FROM assessments_question WHERE name='How do you call a function named "myFunction" in Python?' LIMIT 1), 'call myFunction()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you call a function named "myFunction" in Python?' LIMIT 1), 'myFunction', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you call a function named "myFunction" in Python?' LIMIT 1), 'myFunction()', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you call a function named "myFunction" in Python?' LIMIT 1), 'invoke myFunction', FALSE),

((SELECT id FROM assessments_question WHERE name='Which statement is used to end a function and return a value?' LIMIT 1), 'return', TRUE),
((SELECT id FROM assessments_question WHERE name='Which statement is used to end a function and return a value?' LIMIT 1), 'end', FALSE),
((SELECT id FROM assessments_question WHERE name='Which statement is used to end a function and return a value?' LIMIT 1), 'exit', FALSE),
((SELECT id FROM assessments_question WHERE name='Which statement is used to end a function and return a value?' LIMIT 1), 'finish', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you import a module named "math" in Python?' LIMIT 1), 'import math', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you import a module named "math" in Python?' LIMIT 1), 'use math', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you import a module named "math" in Python?' LIMIT 1), 'include math', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you import a module named "math" in Python?' LIMIT 1), 'require math', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the purpose of the "import" statement in Python?' LIMIT 1), 'To define a function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "import" statement in Python?' LIMIT 1), 'To call a function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "import" statement in Python?' LIMIT 1), 'To import external modules', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "import" statement in Python?' LIMIT 1), 'To end a function', FALSE);

-- Working with Files Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Working with Files Quiz' LIMIT 1), 'Which function is used to open a file in Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Working with Files Quiz' LIMIT 1), 'How do you close a file in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Working with Files Quiz' LIMIT 1), 'Which mode is used to open a file for reading in Python?', 60),
((SELECT id FROM assessments_assessment WHERE title='Working with Files Quiz' LIMIT 1), 'How do you read the entire content of a file in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Working with Files Quiz' LIMIT 1), 'How do you write content to a file in Python?', 20);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which function is used to open a file in Python?' LIMIT 1), 'open()', TRUE),
((SELECT id FROM assessments_question WHERE name='Which function is used to open a file in Python?' LIMIT 1), 'read()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which function is used to open a file in Python?' LIMIT 1), 'close()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which function is used to open a file in Python?' LIMIT 1), 'write()', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you close a file in Python?' LIMIT 1), 'close()', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you close a file in Python?' LIMIT 1), 'open()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you close a file in Python?' LIMIT 1), 'read()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you close a file in Python?' LIMIT 1), 'write()', FALSE),

((SELECT id FROM assessments_question WHERE name='Which mode is used to open a file for reading in Python?' LIMIT 1), 'r', TRUE),
((SELECT id FROM assessments_question WHERE name='Which mode is used to open a file for reading in Python?' LIMIT 1), 'read', FALSE),
((SELECT id FROM assessments_question WHERE name='Which mode is used to open a file for reading in Python?' LIMIT 1), 'readline', FALSE),
((SELECT id FROM assessments_question WHERE name='Which mode is used to open a file for reading in Python?' LIMIT 1), 'w', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you read the entire content of a file in Python?' LIMIT 1), 'read()', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you read the entire content of a file in Python?' LIMIT 1), 'open()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you read the entire content of a file in Python?' LIMIT 1), 'close()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you read the entire content of a file in Python?' LIMIT 1), 'write()', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you write content to a file in Python?' LIMIT 1), 'write()', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you write content to a file in Python?' LIMIT 1), 'open()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you write content to a file in Python?' LIMIT 1), 'read()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you write content to a file in Python?' LIMIT 1), 'close()', FALSE);

-- Insert courses
INSERT INTO courses_course (title, description, thumbnail) VALUES
('Git & GitHub', 'A comprehensive course on Git and GitHub.', NULL);

-- Insert lessons
INSERT INTO courses_lesson (title, course_id) VALUES
('Introduction to Git', (SELECT id FROM courses_course WHERE title='Git & GitHub' LIMIT 1)),
('Branching and Merging', (SELECT id FROM courses_course WHERE title='Git & GitHub' LIMIT 1)),
('Introduction to GitHub', (SELECT id FROM courses_course WHERE title='Git & GitHub' LIMIT 1));

-- Insert assessments (Quizzes for each lesson)
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Introduction to Git Quiz', 'quiz', 70, 'Quiz on Introduction to Git', NULL, (SELECT id FROM courses_lesson WHERE title='Introduction to Git' LIMIT 1), 30),
('Branching and Merging Quiz', 'quiz', 70, 'Quiz on Branching and Merging', NULL, (SELECT id FROM courses_lesson WHERE title='Branching and Merging' LIMIT 1), 30),
('Introduction to GitHub Quiz', 'quiz', 70, 'Quiz on Introduction to GitHub', NULL, (SELECT id FROM courses_lesson WHERE title='Introduction to GitHub' LIMIT 1), 30);

-- Insert questions and answers for each quiz

-- Introduction to Git Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'What is Git?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Who developed Git?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which command initializes a new Git repository?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which command is used to check the current Git status?', 80),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which command is used to add changes to the staging area?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which command commits changes to the repository?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which file is used to ignore files in a Git repository?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'How do you clone an existing Git repository?', 80),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which command shows the commit history?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Git Quiz' LIMIT 1), 'Which command is used to create a new branch?', 40);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is Git?' LIMIT 1), 'A type of version control system', TRUE),
((SELECT id FROM assessments_question WHERE name='What is Git?' LIMIT 1), 'A programming language', FALSE),
((SELECT id FROM assessments_question WHERE name='What is Git?' LIMIT 1), 'A text editor', FALSE),
((SELECT id FROM assessments_question WHERE name='What is Git?' LIMIT 1), 'A web browser', FALSE),

((SELECT id FROM assessments_question WHERE name='Who developed Git?' LIMIT 1), 'Linus Torvalds', TRUE),
((SELECT id FROM assessments_question WHERE name='Who developed Git?' LIMIT 1), 'Guido van Rossum', FALSE),
((SELECT id FROM assessments_question WHERE name='Who developed Git?' LIMIT 1), 'James Gosling', FALSE),
((SELECT id FROM assessments_question WHERE name='Who developed Git?' LIMIT 1), 'Bjarne Stroustrup', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command initializes a new Git repository?' LIMIT 1), 'git init', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command initializes a new Git repository?' LIMIT 1), 'git start', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command initializes a new Git repository?' LIMIT 1), 'git create', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command initializes a new Git repository?' LIMIT 1), 'git new', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command is used to check the current Git status?' LIMIT 1), 'git status', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command is used to check the current Git status?' LIMIT 1), 'git check', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command is used to check the current Git status?' LIMIT 1), 'git verify', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command is used to check the current Git status?' LIMIT 1), 'git inspect', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command is used to add changes to the staging area?' LIMIT 1), 'git add', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command is used to add changes to the staging area?' LIMIT 1), 'git stage', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command is used to add changes to the staging area?' LIMIT 1), 'git include', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command is used to add changes to the staging area?' LIMIT 1), 'git append', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command commits changes to the repository?' LIMIT 1), 'git commit', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command commits changes to the repository?' LIMIT 1), 'git save', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command commits changes to the repository?' LIMIT 1), 'git push', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command commits changes to the repository?' LIMIT 1), 'git submit', FALSE),

((SELECT id FROM assessments_question WHERE name='Which file is used to ignore files in a Git repository?' LIMIT 1), '.gitignore', TRUE),
((SELECT id FROM assessments_question WHERE name='Which file is used to ignore files in a Git repository?' LIMIT 1), '.gitexclude', FALSE),
((SELECT id FROM assessments_question WHERE name='Which file is used to ignore files in a Git repository?' LIMIT 1), '.ignore', FALSE),
((SELECT id FROM assessments_question WHERE name='Which file is used to ignore files in a Git repository?' LIMIT 1), 'ignore.git', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you clone an existing Git repository?' LIMIT 1), 'git clone', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you clone an existing Git repository?' LIMIT 1), 'git copy', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you clone an existing Git repository?' LIMIT 1), 'git replicate', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you clone an existing Git repository?' LIMIT 1), 'git duplicate', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command shows the commit history?' LIMIT 1), 'git log', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command shows the commit history?' LIMIT 1), 'git history', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command shows the commit history?' LIMIT 1), 'git commits', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command shows the commit history?' LIMIT 1), 'git timeline', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command is used to create a new branch?' LIMIT 1), 'git branch', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command is used to create a new branch?' LIMIT 1), 'git new-branch', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command is used to create a new branch?' LIMIT 1), 'git create-branch', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command is used to create a new branch?' LIMIT 1), 'git add-branch', FALSE);

-- Branching and Merging Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'What is a branch in Git?', 20),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'How do you create a new branch in Git?', 40),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'How do you switch to a different branch in Git?', 60),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'How do you merge two branches in Git?', 80),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'Which command deletes a branch in Git?', 20),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'What is a merge conflict in Git?', 40),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'How do you resolve merge conflicts in Git?', 60),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'Which command shows all branches in Git?', 80),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'What is the default branch in a new Git repository?', 20),
((SELECT id FROM assessments_assessment WHERE title='Branching and Merging Quiz' LIMIT 1), 'Which command renames a branch in Git?', 40);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a branch in Git?' LIMIT 1), 'A parallel version of the repository', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a branch in Git?' LIMIT 1), 'A copy of the repository', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a branch in Git?' LIMIT 1), 'A remote repository', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a branch in Git?' LIMIT 1), 'A tag in the repository', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you create a new branch in Git?' LIMIT 1), 'git branch <branch_name>', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a new branch in Git?' LIMIT 1), 'git create <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a new branch in Git?' LIMIT 1), 'git new <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a new branch in Git?' LIMIT 1), 'git init <branch_name>', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you switch to a different branch in Git?' LIMIT 1), 'git checkout <branch_name>', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you switch to a different branch in Git?' LIMIT 1), 'git switch <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you switch to a different branch in Git?' LIMIT 1), 'git change <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you switch to a different branch in Git?' LIMIT 1), 'git move <branch_name>', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you merge two branches in Git?' LIMIT 1), 'git merge <branch_name>', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you merge two branches in Git?' LIMIT 1), 'git combine <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you merge two branches in Git?' LIMIT 1), 'git join <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you merge two branches in Git?' LIMIT 1), 'git connect <branch_name>', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command deletes a branch in Git?' LIMIT 1), 'git branch -d <branch_name>', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command deletes a branch in Git?' LIMIT 1), 'git delete <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command deletes a branch in Git?' LIMIT 1), 'git remove <branch_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command deletes a branch in Git?' LIMIT 1), 'git discard <branch_name>', FALSE),

((SELECT id FROM assessments_question WHERE name='What is a merge conflict in Git?' LIMIT 1), 'A conflict that occurs when merging branches', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a merge conflict in Git?' LIMIT 1), 'A conflict that occurs when deleting branches', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a merge conflict in Git?' LIMIT 1), 'A conflict that occurs when creating branches', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a merge conflict in Git?' LIMIT 1), 'A conflict that occurs when switching branches', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you resolve merge conflicts in Git?' LIMIT 1), 'Manually edit the conflicting files', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you resolve merge conflicts in Git?' LIMIT 1), 'Delete the conflicting branch', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you resolve merge conflicts in Git?' LIMIT 1), 'Revert the conflicting commit', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you resolve merge conflicts in Git?' LIMIT 1), 'Use git reset to resolve conflicts', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command shows all branches in Git?' LIMIT 1), 'git branch', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command shows all branches in Git?' LIMIT 1), 'git show-branches', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command shows all branches in Git?' LIMIT 1), 'git list-branches', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command shows all branches in Git?' LIMIT 1), 'git view-branches', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the default branch in a new Git repository?' LIMIT 1), 'main', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the default branch in a new Git repository?' LIMIT 1), 'master', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the default branch in a new Git repository?' LIMIT 1), 'develop', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the default branch in a new Git repository?' LIMIT 1), 'feature', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command renames a branch in Git?' LIMIT 1), 'git branch -m <new_name>', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command renames a branch in Git?' LIMIT 1), 'git rename <new_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command renames a branch in Git?' LIMIT 1), 'git change <new_name>', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command renames a branch in Git?' LIMIT 1), 'git mv <new_name>', FALSE);

-- Introduction to GitHub Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'What is GitHub?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'How do you create a new repository on GitHub?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'Which command pushes changes to a remote repository?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'How do you fork a repository on GitHub?', 80),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'What is a pull request on GitHub?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'How do you open an issue on GitHub?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'Which command pulls changes from a remote repository?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'How do you star a repository on GitHub?', 80),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'What is GitHub Actions?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to GitHub Quiz' LIMIT 1), 'How do you clone a repository from GitHub?', 40);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is GitHub?' LIMIT 1), 'A platform for version control and collaboration', TRUE),
((SELECT id FROM assessments_question WHERE name='What is GitHub?' LIMIT 1), 'A programming language', FALSE),
((SELECT id FROM assessments_question WHERE name='What is GitHub?' LIMIT 1), 'A text editor', FALSE),
((SELECT id FROM assessments_question WHERE name='What is GitHub?' LIMIT 1), 'A web browser', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you create a new repository on GitHub?' LIMIT 1), 'Click on the "New repository" button', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a new repository on GitHub?' LIMIT 1), 'Use the "git init" command', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a new repository on GitHub?' LIMIT 1), 'Click on the "New" button', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a new repository on GitHub?' LIMIT 1), 'Use the "git create" command', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command pushes changes to a remote repository?' LIMIT 1), 'git push', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command pushes changes to a remote repository?' LIMIT 1), 'git commit', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command pushes changes to a remote repository?' LIMIT 1), 'git save', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command pushes changes to a remote repository?' LIMIT 1), 'git upload', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you fork a repository on GitHub?' LIMIT 1), 'Click on the "Fork" button', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you fork a repository on GitHub?' LIMIT 1), 'Use the "git fork" command', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you fork a repository on GitHub?' LIMIT 1), 'Click on the "Clone" button', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you fork a repository on GitHub?' LIMIT 1), 'Use the "git clone" command', FALSE),

((SELECT id FROM assessments_question WHERE name='What is a pull request on GitHub?' LIMIT 1), 'A request to merge code changes into a repository', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a pull request on GitHub?' LIMIT 1), 'A request to delete a repository', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a pull request on GitHub?' LIMIT 1), 'A request to create a new repository', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a pull request on GitHub?' LIMIT 1), 'A request to fork a repository', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you open an issue on GitHub?' LIMIT 1), 'Click on the "New issue" button', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you open an issue on GitHub?' LIMIT 1), 'Use the "git issue" command', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you open an issue on GitHub?' LIMIT 1), 'Click on the "Open issue" button', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you open an issue on GitHub?' LIMIT 1), 'Use the "git open" command', FALSE),

((SELECT id FROM assessments_question WHERE name='Which command pulls changes from a remote repository?' LIMIT 1), 'git pull', TRUE),
((SELECT id FROM assessments_question WHERE name='Which command pulls changes from a remote repository?' LIMIT 1), 'git fetch', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command pulls changes from a remote repository?' LIMIT 1), 'git download', FALSE),
((SELECT id FROM assessments_question WHERE name='Which command pulls changes from a remote repository?' LIMIT 1), 'git receive', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you star a repository on GitHub?' LIMIT 1), 'Click on the "Star" button', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you star a repository on GitHub?' LIMIT 1), 'Use the "git star" command', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you star a repository on GitHub?' LIMIT 1), 'Click on the "Favorite" button', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you star a repository on GitHub?' LIMIT 1), 'Use the "git favorite" command', FALSE),

((SELECT id FROM assessments_question WHERE name='What is GitHub Actions?' LIMIT 1), 'A CI/CD tool for automating workflows', TRUE),
((SELECT id FROM assessments_question WHERE name='What is GitHub Actions?' LIMIT 1), 'A version control system', FALSE),
((SELECT id FROM assessments_question WHERE name='What is GitHub Actions?' LIMIT 1), 'A text editor', FALSE),
((SELECT id FROM assessments_question WHERE name='What is GitHub Actions?' LIMIT 1), 'A package manager', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you clone a repository from GitHub?' LIMIT 1), 'git clone <repository_url>', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you clone a repository from GitHub?' LIMIT 1), 'git fork <repository_url>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you clone a repository from GitHub?' LIMIT 1), 'git copy <repository_url>', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you clone a repository from GitHub?' LIMIT 1), 'git replicate <repository_url>', FALSE);

COMMIT;

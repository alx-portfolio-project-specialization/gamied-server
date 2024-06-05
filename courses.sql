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
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a function in Python?' LIMIT 1), 'function', FALSE),
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

-- Insert content Links
INSERT INTO courses_contentlink (lesson_id, title, href) VALUES
((SELECT id FROM courses_lesson WHERE title='Introduction to Git' LIMIT 1), 'Git - Official Website', 'https://git-scm.com/'),
((SELECT id FROM courses_lesson WHERE title='Introduction to Git' LIMIT 1), 'Git Tutorial - Atlassian', 'https://www.atlassian.com/git/tutorials/what-is-git'),
((SELECT id FROM courses_lesson WHERE title='Introduction to Git' LIMIT 1), 'Git Basics - W3Schools', 'https://www.w3schools.com/git/'),

((SELECT id FROM courses_lesson WHERE title='Branching and Merging' LIMIT 1), 'Git Branching - Atlassian', 'https://www.atlassian.com/git/tutorials/using-branches'),
((SELECT id FROM courses_lesson WHERE title='Branching and Merging' LIMIT 1), 'Branching and Merging - Git SCM', 'https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging'),
((SELECT id FROM courses_lesson WHERE title='Branching and Merging' LIMIT 1), 'Git Branching and Merging - GeeksforGeeks', 'https://www.geeksforgeeks.org/branching-and-merging-in-git/'),

((SELECT id FROM courses_lesson WHERE title='Introduction to GitHub' LIMIT 1), 'GitHub - Official Website', 'https://github.com/'),
((SELECT id FROM courses_lesson WHERE title='Introduction to GitHub' LIMIT 1), 'GitHub Guides', 'https://guides.github.com/activities/hello-world/'),
((SELECT id FROM courses_lesson WHERE title='Introduction to GitHub' LIMIT 1), 'Getting Started with GitHub - GitHub Docs', 'https://docs.github.com/en/github/getting-started-with-github');


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

-- Insert courses
INSERT INTO courses_course (title, description, thumbnail) VALUES
('Financial Accounting Basics', 'A comprehensive course on financial accounting.', NULL);

-- Insert lessons
INSERT INTO courses_lesson (title, course_id) VALUES
('Introduction to Financial Accounting', (SELECT id FROM courses_course WHERE title='Financial Accounting Basics' LIMIT 1)),
('Accounting Principles and Concepts', (SELECT id FROM courses_course WHERE title='Financial Accounting Basics' LIMIT 1)),
('Financial Statements', (SELECT id FROM courses_course WHERE title='Financial Accounting Basics' LIMIT 1)),
('Recording Transactions', (SELECT id FROM courses_course WHERE title='Financial Accounting Basics' LIMIT 1)),
('Adjusting Entries and Closing', (SELECT id FROM courses_course WHERE title='Financial Accounting Basics' LIMIT 1));

-- Insert content links
INSERT INTO courses_contentlink (lesson_id, title, href) VALUES
((SELECT id FROM courses_lesson WHERE title='Introduction to Financial Accounting' LIMIT 1), 'Accounting - Wikipedia', 'https://en.wikipedia.org/wiki/Accounting'),
((SELECT id FROM courses_lesson WHERE title='Introduction to Financial Accounting' LIMIT 1), 'Introduction to Accounting - Investopedia', 'https://www.investopedia.com/terms/a/accounting.asp'),

((SELECT id FROM courses_lesson WHERE title='Accounting Principles and Concepts' LIMIT 1), 'Accounting Principles - AccountingCoach', 'https://www.accountingcoach.com/accounting-principles/explanation'),
((SELECT id FROM courses_lesson WHERE title='Accounting Principles and Concepts' LIMIT 1), 'GAAP - Investopedia', 'https://www.investopedia.com/terms/g/gaap.asp'),

((SELECT id FROM courses_lesson WHERE title='Financial Statements' LIMIT 1), 'Financial Statements - Investopedia', 'https://www.investopedia.com/terms/f/financial-statements.asp'),
((SELECT id FROM courses_lesson WHERE title='Financial Statements' LIMIT 1), 'Understanding Financial Statements - AccountingTools', 'https://www.accountingtools.com/articles/financial-statements'),

((SELECT id FROM courses_lesson WHERE title='Recording Transactions' LIMIT 1), 'Recording Transactions - AccountingCoach', 'https://www.accountingcoach.com/bookkeeping/explanation'),
((SELECT id FROM courses_lesson WHERE title='Recording Transactions' LIMIT 1), 'How to Record Transactions - WikiHow', 'https://www.wikihow.com/Record-Accounting-Journal-Entries'),

((SELECT id FROM courses_lesson WHERE title='Adjusting Entries and Closing' LIMIT 1), 'Adjusting Entries - AccountingCoach', 'https://www.accountingcoach.com/adjusting-entries/explanation'),
((SELECT id FROM courses_lesson WHERE title='Adjusting Entries and Closing' LIMIT 1), 'Year-End Closing Entries - AccountingTools', 'https://www.accountingtools.com/articles/year-end-closing-entries');

-- Insert assessments (Quizzes for each lesson)
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Introduction to Financial Accounting Quiz', 'quiz', 70, 'Quiz on Introduction to Financial Accounting', NULL, (SELECT id FROM courses_lesson WHERE title='Introduction to Financial Accounting' LIMIT 1), 30),
('Accounting Principles and Concepts Quiz', 'quiz', 70, 'Quiz on Accounting Principles and Concepts', NULL, (SELECT id FROM courses_lesson WHERE title='Accounting Principles and Concepts' LIMIT 1), 30),
('Financial Statements Quiz', 'quiz', 70, 'Quiz on Financial Statements', NULL, (SELECT id FROM courses_lesson WHERE title='Financial Statements' LIMIT 1), 30),
('Recording Transactions Quiz', 'quiz', 70, 'Quiz on Recording Transactions', NULL, (SELECT id FROM courses_lesson WHERE title='Recording Transactions' LIMIT 1), 30),
('Adjusting Entries and Closing Quiz', 'quiz', 70, 'Quiz on Adjusting Entries and Closing', NULL, (SELECT id FROM courses_lesson WHERE title='Adjusting Entries and Closing' LIMIT 1), 30);

-- Insert questions and answers for each quiz

-- Introduction to Financial Accounting Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Introduction to Financial Accounting Quiz' LIMIT 1), 'What is accounting?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Financial Accounting Quiz' LIMIT 1), 'Which financial statement shows a company''s financial position?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Financial Accounting Quiz' LIMIT 1), 'What is the main objective of financial accounting?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Financial Accounting Quiz' LIMIT 1), 'Which of the following is considered an asset?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is accounting?' LIMIT 1), 'The process of managing people', FALSE),
((SELECT id FROM assessments_question WHERE name='What is accounting?' LIMIT 1), 'The process of recording financial transactions', TRUE),
((SELECT id FROM assessments_question WHERE name='What is accounting?' LIMIT 1), 'The process of creating marketing strategies', FALSE),
((SELECT id FROM assessments_question WHERE name='What is accounting?' LIMIT 1), 'The process of developing software', FALSE),

((SELECT id FROM assessments_question WHERE name='Which financial statement shows a company''s financial position?' LIMIT 1), 'Income Statement', FALSE),
((SELECT id FROM assessments_question WHERE name='Which financial statement shows a company''s financial position?' LIMIT 1), 'Statement of Cash Flows', FALSE),
((SELECT id FROM assessments_question WHERE name='Which financial statement shows a company''s financial position?' LIMIT 1), 'Balance Sheet', TRUE),
((SELECT id FROM assessments_question WHERE name='Which financial statement shows a company''s financial position?' LIMIT 1), 'Statement of Retained Earnings', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the main objective of financial accounting?' LIMIT 1), 'To prepare budgets', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the main objective of financial accounting?' LIMIT 1), 'To provide financial information to external users', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the main objective of financial accounting?' LIMIT 1), 'To manage internal operations', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the main objective of financial accounting?' LIMIT 1), 'To forecast future sales', FALSE),

((SELECT id FROM assessments_question WHERE name='Which of the following is considered an asset?' LIMIT 1), 'Accounts Payable', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is considered an asset?' LIMIT 1), 'Notes Payable', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is considered an asset?' LIMIT 1), 'Accounts Receivable', TRUE),
((SELECT id FROM assessments_question WHERE name='Which of the following is considered an asset?' LIMIT 1), 'Accrued Expenses', FALSE);

-- Accounting Principles and Concepts Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Accounting Principles and Concepts Quiz' LIMIT 1), 'What does GAAP stand for?', 60),
((SELECT id FROM assessments_assessment WHERE title='Accounting Principles and Concepts Quiz' LIMIT 1), 'Which principle states that revenue should be recognized when it is earned?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Principles and Concepts Quiz' LIMIT 1), 'What is the principle of matching?', 40),
((SELECT id FROM assessments_assessment WHERE title='Accounting Principles and Concepts Quiz' LIMIT 1), 'Which principle requires companies to disclose all financial information?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What does GAAP stand for?' LIMIT 1), 'Generally Accepted Accounting Policies', FALSE),
((SELECT id FROM assessments_question WHERE name='What does GAAP stand for?' LIMIT 1), 'Generally Accepted Accounting Principles', TRUE),
((SELECT id FROM assessments_question WHERE name='What does GAAP stand for?' LIMIT 1), 'Global Accounting and Auditing Practices', FALSE),
((SELECT id FROM assessments_question WHERE name='What does GAAP stand for?' LIMIT 1), 'General Accounting and Auditing Policies', FALSE),

((SELECT id FROM assessments_question WHERE name='Which principle states that revenue should be recognized when it is earned?' LIMIT 1), 'Matching Principle', FALSE),
((SELECT id FROM assessments_question WHERE name='Which principle states that revenue should be recognized when it is earned?' LIMIT 1), 'Revenue Recognition Principle', TRUE),
((SELECT id FROM assessments_question WHERE name='Which principle states that revenue should be recognized when it is earned?' LIMIT 1), 'Full Disclosure Principle', FALSE),
((SELECT id FROM assessments_question WHERE name='Which principle states that revenue should be recognized when it is earned?' LIMIT 1), 'Historical Cost Principle', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the principle of matching?' LIMIT 1), 'Expenses should be matched with revenues', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the principle of matching?' LIMIT 1), 'Assets should be matched with liabilities', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the principle of matching?' LIMIT 1), 'Expenses should be recorded when paid', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the principle of matching?' LIMIT 1), 'Revenues should be recorded when received', FALSE),

((SELECT id FROM assessments_question WHERE name='Which principle requires companies to disclose all financial information?' LIMIT 1), 'Conservatism Principle', FALSE),
((SELECT id FROM assessments_question WHERE name='Which principle requires companies to disclose all financial information?' LIMIT 1), 'Full Disclosure Principle', TRUE),
((SELECT id FROM assessments_question WHERE name='Which principle requires companies to disclose all financial information?' LIMIT 1), 'Materiality Principle', FALSE),
((SELECT id FROM assessments_question WHERE name='Which principle requires companies to disclose all financial information?' LIMIT 1), 'Revenue Recognition Principle', FALSE);

-- Financial Statements Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Financial Statements Quiz' LIMIT 1), 'What does an income statement show?', 20),
((SELECT id FROM assessments_assessment WHERE title='Financial Statements Quiz' LIMIT 1), 'Which statement shows the inflow and outflow of cash?', 40),
((SELECT id FROM assessments_assessment WHERE title='Financial Statements Quiz' LIMIT 1), 'Which financial statement includes assets, liabilities, and equity?', 60),
((SELECT id FROM assessments_assessment WHERE title='Financial Statements Quiz' LIMIT 1), 'What is the formula for net income?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What does an income statement show?' LIMIT 1), 'Assets and liabilities', FALSE),
((SELECT id FROM assessments_question WHERE name='What does an income statement show?' LIMIT 1), 'Revenues and expenses', TRUE),
((SELECT id FROM assessments_question WHERE name='What does an income statement show?' LIMIT 1), 'Cash inflows and outflows', FALSE),
((SELECT id FROM assessments_question WHERE name='What does an income statement show?' LIMIT 1), 'Equity', FALSE),

((SELECT id FROM assessments_question WHERE name='Which statement shows the inflow and outflow of cash?' LIMIT 1), 'Balance Sheet', FALSE),
((SELECT id FROM assessments_question WHERE name='Which statement shows the inflow and outflow of cash?' LIMIT 1), 'Statement of Cash Flows', TRUE),
((SELECT id FROM assessments_question WHERE name='Which statement shows the inflow and outflow of cash?' LIMIT 1), 'Income Statement', FALSE),
((SELECT id FROM assessments_question WHERE name='Which statement shows the inflow and outflow of cash?' LIMIT 1), 'Statement of Retained Earnings', FALSE),

((SELECT id FROM assessments_question WHERE name='Which financial statement includes assets, liabilities, and equity?' LIMIT 1), 'Income Statement', FALSE),
((SELECT id FROM assessments_question WHERE name='Which financial statement includes assets, liabilities, and equity?' LIMIT 1), 'Statement of Cash Flows', FALSE),
((SELECT id FROM assessments_question WHERE name='Which financial statement includes assets, liabilities, and equity?' LIMIT 1), 'Balance Sheet', TRUE),
((SELECT id FROM assessments_question WHERE name='Which financial statement includes assets, liabilities, and equity?' LIMIT 1), 'Statement of Retained Earnings', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the formula for net income?' LIMIT 1), 'Revenue - Expenses', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the formula for net income?' LIMIT 1), 'Assets - Liabilities', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the formula for net income?' LIMIT 1), 'Income - Taxes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the formula for net income?' LIMIT 1), 'Equity + Revenue', FALSE);

-- Recording Transactions Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Recording Transactions Quiz' LIMIT 1), 'Which journal entry records a cash sale?', 20),
((SELECT id FROM assessments_assessment WHERE title='Recording Transactions Quiz' LIMIT 1), 'How do you record a purchase on account?', 40),
((SELECT id FROM assessments_assessment WHERE title='Recording Transactions Quiz' LIMIT 1), 'What is a debit?', 60),
((SELECT id FROM assessments_assessment WHERE title='Recording Transactions Quiz' LIMIT 1), 'What is a credit?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which journal entry records a cash sale?' LIMIT 1), 'Debit Cash, Credit Sales', TRUE),
((SELECT id FROM assessments_question WHERE name='Which journal entry records a cash sale?' LIMIT 1), 'Debit Sales, Credit Cash', FALSE),
((SELECT id FROM assessments_question WHERE name='Which journal entry records a cash sale?' LIMIT 1), 'Debit Accounts Receivable, Credit Sales', FALSE),
((SELECT id FROM assessments_question WHERE name='Which journal entry records a cash sale?' LIMIT 1), 'Debit Sales, Credit Accounts Receivable', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you record a purchase on account?' LIMIT 1), 'Debit Cash, Credit Accounts Payable', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you record a purchase on account?' LIMIT 1), 'Debit Accounts Payable, Credit Cash', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you record a purchase on account?' LIMIT 1), 'Debit Purchases, Credit Accounts Payable', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you record a purchase on account?' LIMIT 1), 'Debit Accounts Payable, Credit Purchases', FALSE),

((SELECT id FROM assessments_question WHERE name='What is a debit?' LIMIT 1), 'An entry on the right side of an account', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a debit?' LIMIT 1), 'An entry on the left side of an account', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a debit?' LIMIT 1), 'A reduction in revenue', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a debit?' LIMIT 1), 'An increase in liabilities', FALSE),

((SELECT id FROM assessments_question WHERE name='What is a credit?' LIMIT 1), 'An entry on the left side of an account', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a credit?' LIMIT 1), 'An entry on the right side of an account', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a credit?' LIMIT 1), 'An increase in expenses', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a credit?' LIMIT 1), 'A decrease in assets', FALSE);

-- Adjusting Entries and Closing Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Adjusting Entries and Closing Quiz' LIMIT 1), 'What is an adjusting entry?', 20),
((SELECT id FROM assessments_assessment WHERE title='Adjusting Entries and Closing Quiz' LIMIT 1), 'When are adjusting entries made?', 40),
((SELECT id FROM assessments_assessment WHERE title='Adjusting Entries and Closing Quiz' LIMIT 1), 'What is the purpose of closing entries?', 60),
((SELECT id FROM assessments_assessment WHERE title='Adjusting Entries and Closing Quiz' LIMIT 1), 'Which account is typically affected by adjusting entries?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is an adjusting entry?' LIMIT 1), 'An entry made to correct errors', FALSE),
((SELECT id FROM assessments_question WHERE name='What is an adjusting entry?' LIMIT 1), 'An entry made to update account balances', TRUE),
((SELECT id FROM assessments_question WHERE name='What is an adjusting entry?' LIMIT 1), 'An entry made to record transactions', FALSE),
((SELECT id FROM assessments_question WHERE name='What is an adjusting entry?' LIMIT 1), 'An entry made to close accounts', FALSE),

((SELECT id FROM assessments_question WHERE name='When are adjusting entries made?' LIMIT 1), 'At the beginning of the accounting period', FALSE),
((SELECT id FROM assessments_question WHERE name='When are adjusting entries made?' LIMIT 1), 'During the accounting period', FALSE),
((SELECT id FROM assessments_question WHERE name='When are adjusting entries made?' LIMIT 1), 'At the end of the accounting period', TRUE),
((SELECT id FROM assessments_question WHERE name='When are adjusting entries made?' LIMIT 1), 'Anytime an error is found', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' LIMIT 1), 'To finalize account balances for the next period', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' LIMIT 1), 'To zero out temporary accounts', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' LIMIT 1), 'To adjust financial statements', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' LIMIT 1), 'To record new transactions', FALSE),

((SELECT id FROM assessments_question WHERE name='Which account is typically affected by adjusting entries?' LIMIT 1), 'Cash', FALSE),
((SELECT id FROM assessments_question WHERE name='Which account is typically affected by adjusting entries?' LIMIT 1), 'Accounts Receivable', TRUE),
((SELECT id FROM assessments_question WHERE name='Which account is typically affected by adjusting entries?' LIMIT 1), 'Revenue', FALSE),
((SELECT id FROM assessments_question WHERE name='Which account is typically affected by adjusting entries?' LIMIT 1), 'Equity', FALSE);

-- Insert courses
INSERT INTO courses_course (title, description, thumbnail) VALUES
('Photoshop and Graphic Design', 'A comprehensive course on Photoshop and graphic design.', NULL);

-- Insert lessons
INSERT INTO courses_lesson (title, course_id) VALUES
('Introduction to Photoshop', (SELECT id FROM courses_course WHERE title='Photoshop and Graphic Design' LIMIT 1)),
('Basic Tools and Techniques', (SELECT id FROM courses_course WHERE title='Photoshop and Graphic Design' LIMIT 1)),
('Working with Layers', (SELECT id FROM courses_course WHERE title='Photoshop and Graphic Design' LIMIT 1)),
('Advanced Editing Techniques', (SELECT id FROM courses_course WHERE title='Photoshop and Graphic Design' LIMIT 1)),
('Design Principles', (SELECT id FROM courses_course WHERE title='Photoshop and Graphic Design' LIMIT 1));

-- Insert content links
INSERT INTO courses_contentlink (lesson_id, title, href) VALUES
((SELECT id FROM courses_lesson WHERE title='Introduction to Photoshop' LIMIT 1), 'Photoshop - Official Website', 'https://www.adobe.com/products/photoshop.html'),
((SELECT id FROM courses_lesson WHERE title='Introduction to Photoshop' LIMIT 1), 'Photoshop Basics - Adobe', 'https://helpx.adobe.com/photoshop/tutorials.html'),

((SELECT id FROM courses_lesson WHERE title='Basic Tools and Techniques' LIMIT 1), 'Photoshop Tools - Adobe', 'https://helpx.adobe.com/photoshop/using/tools.html'),
((SELECT id FROM courses_lesson WHERE title='Basic Tools and Techniques' LIMIT 1), 'Basic Photoshop Techniques - CreativeBloq', 'https://www.creativebloq.com/photoshop/tutorials'),

((SELECT id FROM courses_lesson WHERE title='Working with Layers' LIMIT 1), 'Photoshop Layers - Adobe', 'https://helpx.adobe.com/photoshop/using/layer-basics.html'),
((SELECT id FROM courses_lesson WHERE title='Working with Layers' LIMIT 1), 'Layer Techniques - Photoshop Essentials', 'https://www.photoshopessentials.com/photo-editing/layers/'),

((SELECT id FROM courses_lesson WHERE title='Advanced Editing Techniques' LIMIT 1), 'Advanced Photoshop Techniques - Adobe', 'https://helpx.adobe.com/photoshop/using/advanced-compositing.html'),
((SELECT id FROM courses_lesson WHERE title='Advanced Editing Techniques' LIMIT 1), 'Advanced Editing - PhotoshopCAFE', 'https://photoshopcafe.com/tutorials.htm'),

((SELECT id FROM courses_lesson WHERE title='Design Principles' LIMIT 1), 'Graphic Design Principles - Canva', 'https://www.canva.com/learn/graphic-design-basics/'),
((SELECT id FROM courses_lesson WHERE title='Design Principles' LIMIT 1), 'Design Principles - Tuts+', 'https://design.tutsplus.com/articles/27-principles-of-good-web-design--webdesign-9418');

-- Insert assessments (Quizzes for each lesson)
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Introduction to Photoshop Quiz', 'quiz', 70, 'Quiz on Introduction to Photoshop', NULL, (SELECT id FROM courses_lesson WHERE title='Introduction to Photoshop' LIMIT 1), 30),
('Basic Tools and Techniques Quiz', 'quiz', 70, 'Quiz on Basic Tools and Techniques', NULL, (SELECT id FROM courses_lesson WHERE title='Basic Tools and Techniques' LIMIT 1), 30),
('Working with Layers Quiz', 'quiz', 70, 'Quiz on Working with Layers', NULL, (SELECT id FROM courses_lesson WHERE title='Working with Layers' LIMIT 1), 30),
('Advanced Editing Techniques Quiz', 'quiz', 70, 'Quiz on Advanced Editing Techniques', NULL, (SELECT id FROM courses_lesson WHERE title='Advanced Editing Techniques' LIMIT 1), 30),
('Design Principles Quiz', 'quiz', 70, 'Quiz on Design Principles', NULL, (SELECT id FROM courses_lesson WHERE title='Design Principles' LIMIT 1), 30);

-- Insert questions and answers for each quiz

-- Introduction to Photoshop Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Introduction to Photoshop Quiz' LIMIT 1), 'What is Photoshop?', 20),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Photoshop Quiz' LIMIT 1), 'Which company developed Photoshop?', 40),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Photoshop Quiz' LIMIT 1), 'What is the primary function of Photoshop?', 60),
((SELECT id FROM assessments_assessment WHERE title='Introduction to Photoshop Quiz' LIMIT 1), 'Which of the following is a file format supported by Photoshop?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is Photoshop?' LIMIT 1), 'A web browser', FALSE),
((SELECT id FROM assessments_question WHERE name='What is Photoshop?' LIMIT 1), 'A programming language', FALSE),
((SELECT id FROM assessments_question WHERE name='What is Photoshop?' LIMIT 1), 'A graphic design software', TRUE),
((SELECT id FROM assessments_question WHERE name='What is Photoshop?' LIMIT 1), 'A database management system', FALSE),

((SELECT id FROM assessments_question WHERE name='Which company developed Photoshop?' LIMIT 1), 'Microsoft', FALSE),
((SELECT id FROM assessments_question WHERE name='Which company developed Photoshop?' LIMIT 1), 'Google', FALSE),
((SELECT id FROM assessments_question WHERE name='Which company developed Photoshop?' LIMIT 1), 'Adobe', TRUE),
((SELECT id FROM assessments_question WHERE name='Which company developed Photoshop?' LIMIT 1), 'Apple', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the primary function of Photoshop?' LIMIT 1), 'Creating spreadsheets', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the primary function of Photoshop?' LIMIT 1), 'Managing databases', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the primary function of Photoshop?' LIMIT 1), 'Editing images and graphics', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the primary function of Photoshop?' LIMIT 1), 'Developing websites', FALSE),

((SELECT id FROM assessments_question WHERE name='Which of the following is a file format supported by Photoshop?' LIMIT 1), '.txt', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a file format supported by Photoshop?' LIMIT 1), '.psd', TRUE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a file format supported by Photoshop?' LIMIT 1), '.exe', FALSE),
((SELECT id FROM assessments_question WHERE name='Which of the following is a file format supported by Photoshop?' LIMIT 1), '.java', FALSE);

-- Basic Tools and Techniques Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Basic Tools and Techniques Quiz' LIMIT 1), 'What is the use of the Move Tool in Photoshop?', 60),
((SELECT id FROM assessments_assessment WHERE title='Basic Tools and Techniques Quiz' LIMIT 1), 'Which tool is used to select areas of an image based on color?', 20),
((SELECT id FROM assessments_assessment WHERE title='Basic Tools and Techniques Quiz' LIMIT 1), 'What does the Crop Tool do?', 40),
((SELECT id FROM assessments_assessment WHERE title='Basic Tools and Techniques Quiz' LIMIT 1), 'How do you zoom in and out of an image?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the use of the Move Tool in Photoshop?' LIMIT 1), 'To move selected areas or layers', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the use of the Move Tool in Photoshop?' LIMIT 1), 'To draw shapes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the use of the Move Tool in Photoshop?' LIMIT 1), 'To apply filters', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the use of the Move Tool in Photoshop?' LIMIT 1), 'To adjust colors', FALSE),

((SELECT id FROM assessments_question WHERE name='Which tool is used to select areas of an image based on color?' LIMIT 1), 'Magic Wand Tool', TRUE),
((SELECT id FROM assessments_question WHERE name='Which tool is used to select areas of an image based on color?' LIMIT 1), 'Brush Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='Which tool is used to select areas of an image based on color?' LIMIT 1), 'Eraser Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='Which tool is used to select areas of an image based on color?' LIMIT 1), 'Clone Stamp Tool', FALSE),

((SELECT id FROM assessments_question WHERE name='What does the Crop Tool do?' LIMIT 1), 'Removes selected areas of an image', TRUE),
((SELECT id FROM assessments_question WHERE name='What does the Crop Tool do?' LIMIT 1), 'Adds text to an image', FALSE),
((SELECT id FROM assessments_question WHERE name='What does the Crop Tool do?' LIMIT 1), 'Adjusts the brightness of an image', FALSE),
((SELECT id FROM assessments_question WHERE name='What does the Crop Tool do?' LIMIT 1), 'Applies filters to an image', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you zoom in and out of an image?' LIMIT 1), 'Using the Zoom Tool', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you zoom in and out of an image?' LIMIT 1), 'Using the Brush Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you zoom in and out of an image?' LIMIT 1), 'Using the Move Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you zoom in and out of an image?' LIMIT 1), 'Using the Eraser Tool', FALSE);

-- Working with Layers Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Working with Layers Quiz' LIMIT 1), 'What is a layer in Photoshop?', 20),
((SELECT id FROM assessments_assessment WHERE title='Working with Layers Quiz' LIMIT 1), 'How do you create a new layer?', 40),
((SELECT id FROM assessments_assessment WHERE title='Working with Layers Quiz' LIMIT 1), 'What is the purpose of layer masks?', 60),
((SELECT id FROM assessments_assessment WHERE title='Working with Layers Quiz' LIMIT 1), 'How do you merge layers?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a layer in Photoshop?' LIMIT 1), 'A separate level on which you can edit and manipulate an image', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a layer in Photoshop?' LIMIT 1), 'A filter applied to an image', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a layer in Photoshop?' LIMIT 1), 'A tool used to draw shapes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a layer in Photoshop?' LIMIT 1), 'A type of brush', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you create a new layer?' LIMIT 1), 'By clicking the "New Layer" button', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a new layer?' LIMIT 1), 'By using the Brush Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a new layer?' LIMIT 1), 'By applying a filter', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a new layer?' LIMIT 1), 'By adjusting the brightness', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the purpose of layer masks?' LIMIT 1), 'To hide or reveal parts of a layer', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of layer masks?' LIMIT 1), 'To apply filters', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of layer masks?' LIMIT 1), 'To change the color of a layer', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of layer masks?' LIMIT 1), 'To merge layers', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you merge layers?' LIMIT 1), 'By selecting the layers and choosing "Merge Layers"', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you merge layers?' LIMIT 1), 'By using the Brush Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you merge layers?' LIMIT 1), 'By clicking the "New Layer" button', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you merge layers?' LIMIT 1), 'By applying a filter', FALSE);

-- Advanced Editing Techniques Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Advanced Editing Techniques Quiz' LIMIT 1), 'What is the Clone Stamp Tool used for?', 20),
((SELECT id FROM assessments_assessment WHERE title='Advanced Editing Techniques Quiz' LIMIT 1), 'How do you apply a filter to an image?', 40),
((SELECT id FROM assessments_assessment WHERE title='Advanced Editing Techniques Quiz' LIMIT 1), 'What is the purpose of the Healing Brush Tool?', 60),
((SELECT id FROM assessments_assessment WHERE title='Advanced Editing Techniques Quiz' LIMIT 1), 'How do you create a composite image?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the Clone Stamp Tool used for?' LIMIT 1), 'To copy and paste areas of an image', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the Clone Stamp Tool used for?' LIMIT 1), 'To draw shapes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the Clone Stamp Tool used for?' LIMIT 1), 'To adjust brightness', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the Clone Stamp Tool used for?' LIMIT 1), 'To add text', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you apply a filter to an image?' LIMIT 1), 'By selecting "Filter" from the menu', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you apply a filter to an image?' LIMIT 1), 'By using the Brush Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you apply a filter to an image?' LIMIT 1), 'By clicking the "New Layer" button', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you apply a filter to an image?' LIMIT 1), 'By adjusting the brightness', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the purpose of the Healing Brush Tool?' LIMIT 1), 'To remove blemishes and imperfections', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the Healing Brush Tool?' LIMIT 1), 'To draw shapes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the Healing Brush Tool?' LIMIT 1), 'To apply filters', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the Healing Brush Tool?' LIMIT 1), 'To adjust colors', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you create a composite image?' LIMIT 1), 'By combining multiple images into one', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a composite image?' LIMIT 1), 'By applying a filter', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a composite image?' LIMIT 1), 'By using the Brush Tool', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a composite image?' LIMIT 1), 'By adjusting brightness', FALSE);

-- Design Principles Quiz
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Design Principles Quiz' LIMIT 1), 'What is the rule of thirds?', 20),
((SELECT id FROM assessments_assessment WHERE title='Design Principles Quiz' LIMIT 1), 'Which principle involves creating a focal point in a design?', 40),
((SELECT id FROM assessments_assessment WHERE title='Design Principles Quiz' LIMIT 1), 'What is the purpose of contrast in design?', 60),
((SELECT id FROM assessments_assessment WHERE title='Design Principles Quiz' LIMIT 1), 'How do you achieve balance in a design?', 80);

INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the rule of thirds?' LIMIT 1), 'A technique to divide an image into nine equal parts', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the rule of thirds?' LIMIT 1), 'A rule for color selection', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the rule of thirds?' LIMIT 1), 'A method for drawing shapes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the rule of thirds?' LIMIT 1), 'A way to create gradients', FALSE),

((SELECT id FROM assessments_question WHERE name='Which principle involves creating a focal point in a design?' LIMIT 1), 'Emphasis', TRUE),
((SELECT id FROM assessments_question WHERE name='Which principle involves creating a focal point in a design?' LIMIT 1), 'Repetition', FALSE),
((SELECT id FROM assessments_question WHERE name='Which principle involves creating a focal point in a design?' LIMIT 1), 'Alignment', FALSE),
((SELECT id FROM assessments_question WHERE name='Which principle involves creating a focal point in a design?' LIMIT 1), 'Proximity', FALSE),

((SELECT id FROM assessments_question WHERE name='What is the purpose of contrast in design?' LIMIT 1), 'To create visual interest and highlight differences', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of contrast in design?' LIMIT 1), 'To blend elements together', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of contrast in design?' LIMIT 1), 'To make text larger', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of contrast in design?' LIMIT 1), 'To change colors', FALSE),

((SELECT id FROM assessments_question WHERE name='How do you achieve balance in a design?' LIMIT 1), 'By distributing elements evenly', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you achieve balance in a design?' LIMIT 1), 'By using one color', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you achieve balance in a design?' LIMIT 1), 'By drawing shapes', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you achieve balance in a design?' LIMIT 1), 'By adding text', FALSE);

COMMIT;


-- Insert data into existing tables
START TRANSACTION;

-- Python Programming Exam
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Python Programming Exam', 'exam', 75, 'Comprehensive exam on Python programming concepts and practices.', NULL, NULL, 60);

-- Insert questions for the assessment
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What data type is the result of 3 / 2 in Python 3?', 80),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you create a function in Python?', 20),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'Which keyword is used to create a class in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you handle exceptions in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What is a lambda function in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What is the output of print(2 ** 3)?', 60),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you install a package using pip?', 40),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What is the purpose of the __init__.py file in a Python package?', 20),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you create a list in Python?', 60),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'Which method is used to add an element to the end of a list?', 60),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you start a list comprehension in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'Which keyword is used to define a generator function?', 40),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you read a file in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What is the purpose of the "with" statement in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you check if a key exists in a dictionary?', 80),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What is the output of print("Hello, World!"[1])?', 20),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you convert a string to an integer in Python?', 40),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'How do you remove an element from a list by index?', 60),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'What is the difference between a list and a tuple in Python?', 80),
((SELECT id FROM assessments_assessment WHERE title='Python Programming Exam' LIMIT 1), 'Which module in Python is used to work with regular expressions?', 40);

-- Insert answers for each question

-- Question 1
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What data type is the result of 3 / 2 in Python 3?' ORDER BY id DESC LIMIT 1), 'int', FALSE),
((SELECT id FROM assessments_question WHERE name='What data type is the result of 3 / 2 in Python 3?' ORDER BY id DESC LIMIT 1), 'float', TRUE),
((SELECT id FROM assessments_question WHERE name='What data type is the result of 3 / 2 in Python 3?' ORDER BY id DESC LIMIT 1), 'str', FALSE),
((SELECT id FROM assessments_question WHERE name='What data type is the result of 3 / 2 in Python 3?' ORDER BY id DESC LIMIT 1), 'bool', FALSE);

-- Question 2
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you create a function in Python?' ORDER BY id DESC LIMIT 1), 'function myFunc():', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a function in Python?' ORDER BY id DESC LIMIT 1), 'def myFunc():', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a function in Python?' ORDER BY id DESC LIMIT 1), 'func myFunc():', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a function in Python?' ORDER BY id DESC LIMIT 1), 'create myFunc():', FALSE);

-- Question 3
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which keyword is used to create a class in Python?' ORDER BY id DESC LIMIT 1), 'function', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to create a class in Python?' ORDER BY id DESC LIMIT 1), 'def', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to create a class in Python?' ORDER BY id DESC LIMIT 1), 'class', TRUE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to create a class in Python?' ORDER BY id DESC LIMIT 1), 'create', FALSE);

-- Question 4
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in Python?' ORDER BY id DESC LIMIT 1), 'try...catch', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in Python?' ORDER BY id DESC LIMIT 1), 'try...except', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in Python?' ORDER BY id DESC LIMIT 1), 'try...handle', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in Python?' ORDER BY id DESC LIMIT 1), 'try...rescue', FALSE);

-- Question 5
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a lambda function in Python?' ORDER BY id DESC LIMIT 1), 'A function created using the lambda keyword', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a lambda function in Python?' ORDER BY id DESC LIMIT 1), 'A function defined using the def keyword', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a lambda function in Python?' ORDER BY id DESC LIMIT 1), 'A function that always returns None', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a lambda function in Python?' ORDER BY id DESC LIMIT 1), 'A function used for file handling', FALSE);

-- Question 6
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the output of print(2 ** 3)?' ORDER BY id DESC LIMIT 1), '5', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the output of print(2 ** 3)?' ORDER BY id DESC LIMIT 1), '6', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the output of print(2 ** 3)?' ORDER BY id DESC LIMIT 1), '8', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the output of print(2 ** 3)?' ORDER BY id DESC LIMIT 1), '9', FALSE);

-- Question 7
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you install a package using pip?' ORDER BY id DESC LIMIT 1), 'pip install package_name', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you install a package using pip?' ORDER BY id DESC LIMIT 1), 'install package_name', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you install a package using pip?' ORDER BY id DESC LIMIT 1), 'pip get package_name', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you install a package using pip?' ORDER BY id DESC LIMIT 1), 'get package_name', FALSE);

-- Question 8
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the purpose of the __init__.py file in a Python package?' ORDER BY id DESC LIMIT 1), 'To initialize the package', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the __init__.py file in a Python package?' ORDER BY id DESC LIMIT 1), 'To define a class', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the __init__.py file in a Python package?' ORDER BY id DESC LIMIT 1), 'To handle exceptions', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the __init__.py file in a Python package?' ORDER BY id DESC LIMIT 1), 'To create a function', FALSE);

-- Question 9
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you create a list in Python?' ORDER BY id DESC LIMIT 1), 'mylist = []', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a list in Python?' ORDER BY id DESC LIMIT 1), 'mylist = ()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a list in Python?' ORDER BY id DESC LIMIT 1), 'mylist = {}', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a list in Python?' ORDER BY id DESC LIMIT 1), 'mylist = <>', FALSE);

-- Question 10
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which method is used to add an element to the end of a list?' ORDER BY id DESC LIMIT 1), 'append()', TRUE),
((SELECT id FROM assessments_question WHERE name='Which method is used to add an element to the end of a list?' ORDER BY id DESC LIMIT 1), 'add()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which method is used to add an element to the end of a list?' ORDER BY id DESC LIMIT 1), 'insert()', FALSE),
((SELECT id FROM assessments_question WHERE name='Which method is used to add an element to the end of a list?' ORDER BY id DESC LIMIT 1), 'extend()', FALSE);

-- Question 11
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you start a list comprehension in Python?' ORDER BY id DESC LIMIT 1), '[for x in range(10)]', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you start a list comprehension in Python?' ORDER BY id DESC LIMIT 1), '[x for x in range(10)]', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you start a list comprehension in Python?' ORDER BY id DESC LIMIT 1), '{x for x in range(10)}', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you start a list comprehension in Python?' ORDER BY id DESC LIMIT 1), '(x for x in range(10))', FALSE);

-- Question 12
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a generator function?' ORDER BY id DESC LIMIT 1), 'def', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a generator function?' ORDER BY id DESC LIMIT 1), 'yield', TRUE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a generator function?' ORDER BY id DESC LIMIT 1), 'return', FALSE),
((SELECT id FROM assessments_question WHERE name='Which keyword is used to define a generator function?' ORDER BY id DESC LIMIT 1), 'function', FALSE);

-- Question 13
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you read a file in Python?' ORDER BY id DESC LIMIT 1), 'file.read()', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you read a file in Python?' ORDER BY id DESC LIMIT 1), 'file.write()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you read a file in Python?' ORDER BY id DESC LIMIT 1), 'file.open()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you read a file in Python?' ORDER BY id DESC LIMIT 1), 'file.close()', FALSE);

-- Question 14
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "with" statement in Python?' ORDER BY id DESC LIMIT 1), 'To create a loop', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "with" statement in Python?' ORDER BY id DESC LIMIT 1), 'To handle exceptions', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "with" statement in Python?' ORDER BY id DESC LIMIT 1), 'To ensure proper resource management', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the "with" statement in Python?' ORDER BY id DESC LIMIT 1), 'To define a class', FALSE);

-- Question 15
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you check if a key exists in a dictionary?' ORDER BY id DESC LIMIT 1), 'if key in dict:', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you check if a key exists in a dictionary?' ORDER BY id DESC LIMIT 1), 'if key exists dict:', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you check if a key exists in a dictionary?' ORDER BY id DESC LIMIT 1), 'if key.has_key(dict):', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you check if a key exists in a dictionary?' ORDER BY id DESC LIMIT 1), 'if dict.has_key(key):', FALSE);

-- Question 16
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the output of print("Hello, World!"[1])?' ORDER BY id DESC LIMIT 1), 'H', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the output of print("Hello, World!"[1])?' ORDER BY id DESC LIMIT 1), 'e', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the output of print("Hello, World!"[1])?' ORDER BY id DESC LIMIT 1), 'l', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the output of print("Hello, World!"[1])?' ORDER BY id DESC LIMIT 1), 'o', FALSE);

-- Question 17
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you convert a string to an integer in Python?' ORDER BY id DESC LIMIT 1), 'int(str)', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you convert a string to an integer in Python?' ORDER BY id DESC LIMIT 1), 'str.toInt()', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you convert a string to an integer in Python?' ORDER BY id DESC LIMIT 1), 'integer(str)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you convert a string to an integer in Python?' ORDER BY id DESC LIMIT 1), 'str(int)', FALSE);

-- Question 18
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you remove an element from a list by index?' ORDER BY id DESC LIMIT 1), 'list.remove(index)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you remove an element from a list by index?' ORDER BY id DESC LIMIT 1), 'list.pop(index)', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you remove an element from a list by index?' ORDER BY id DESC LIMIT 1), 'list.delete(index)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you remove an element from a list by index?' ORDER BY id DESC LIMIT 1), 'list.clear(index)', FALSE);

-- Question 19
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the difference between a list and a tuple in Python?' ORDER BY id DESC LIMIT 1), 'A list is mutable, a tuple is immutable', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the difference between a list and a tuple in Python?' ORDER BY id DESC LIMIT 1), 'A list is immutable, a tuple is mutable', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between a list and a tuple in Python?' ORDER BY id DESC LIMIT 1), 'A list is ordered, a tuple is unordered', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between a list and a tuple in Python?' ORDER BY id DESC LIMIT 1), 'A list can contain only one type of data, a tuple can contain multiple types', FALSE);

-- Question 20
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='Which module in Python is used to work with regular expressions?' ORDER BY id DESC LIMIT 1), 're', TRUE),
((SELECT id FROM assessments_question WHERE name='Which module in Python is used to work with regular expressions?' ORDER BY id DESC LIMIT 1), 'regex', FALSE),
((SELECT id FROM assessments_question WHERE name='Which module in Python is used to work with regular expressions?' ORDER BY id DESC LIMIT 1), 'exp', FALSE),
((SELECT id FROM assessments_question WHERE name='Which module in Python is used to work with regular expressions?' ORDER BY id DESC LIMIT 1), 'reg', FALSE);


-- Accounting Exam
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Accounting Exam', 'exam', 70, 'Comprehensive exam on Accounting principles and practices.', NULL, NULL, 60);

-- Insert questions for the assessment
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What are the three main types of financial statements?', 60),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the accounting equation?', 40),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What does double-entry bookkeeping mean?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is a ledger?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What are current assets?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is depreciation?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the difference between accounts payable and accounts receivable?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is a trial balance?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is accrual accounting?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is a balance sheet?', 60),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What are liabilities?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is equity?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the purpose of an income statement?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the matching principle?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the revenue recognition principle?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the difference between cash basis and accrual basis accounting?', 80),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is a general journal?', 20),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is a fiscal year?', 60),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is a chart of accounts?', 60),
((SELECT id FROM assessments_assessment WHERE title='Accounting Exam' LIMIT 1), 'What is the purpose of closing entries?', 60);

-- Insert answers for each question

-- Question 1
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are the three main types of financial statements?' ORDER BY id DESC LIMIT 1), 'Income Statement, Balance Sheet, Statement of Cash Flows', TRUE),
((SELECT id FROM assessments_question WHERE name='What are the three main types of financial statements?' ORDER BY id DESC LIMIT 1), 'Income Statement, Statement of Retained Earnings, Balance Sheet', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the three main types of financial statements?' ORDER BY id DESC LIMIT 1), 'Balance Sheet, Statement of Changes in Equity, Statement of Cash Flows', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the three main types of financial statements?' ORDER BY id DESC LIMIT 1), 'Statement of Financial Position, Income Statement, Statement of Changes in Equity', FALSE);

-- Question 2
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the accounting equation?' ORDER BY id DESC LIMIT 1), 'Assets = Liabilities + Equity', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the accounting equation?' ORDER BY id DESC LIMIT 1), 'Assets = Liabilities - Equity', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the accounting equation?' ORDER BY id DESC LIMIT 1), 'Assets + Liabilities = Equity', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the accounting equation?' ORDER BY id DESC LIMIT 1), 'Assets - Liabilities = Equity', FALSE);

-- Question 3
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What does double-entry bookkeeping mean?' ORDER BY id DESC LIMIT 1), 'Every transaction affects at least two accounts', TRUE),
((SELECT id FROM assessments_question WHERE name='What does double-entry bookkeeping mean?' ORDER BY id DESC LIMIT 1), 'Every transaction is recorded twice', FALSE),
((SELECT id FROM assessments_question WHERE name='What does double-entry bookkeeping mean?' ORDER BY id DESC LIMIT 1), 'Every account has a debit and a credit', FALSE),
((SELECT id FROM assessments_question WHERE name='What does double-entry bookkeeping mean?' ORDER BY id DESC LIMIT 1), 'Every transaction must be approved by two people', FALSE);

-- Question 4
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a ledger?' ORDER BY id DESC LIMIT 1), 'A book or other collection of financial accounts', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a ledger?' ORDER BY id DESC LIMIT 1), 'A list of company employees', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a ledger?' ORDER BY id DESC LIMIT 1), 'A type of tax form', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a ledger?' ORDER BY id DESC LIMIT 1), 'A bank statement', FALSE);

-- Question 5
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are current assets?' ORDER BY id DESC LIMIT 1), 'Assets expected to be converted into cash within a year', TRUE),
((SELECT id FROM assessments_question WHERE name='What are current assets?' ORDER BY id DESC LIMIT 1), 'Assets expected to be converted into cash after a year', FALSE),
((SELECT id FROM assessments_question WHERE name='What are current assets?' ORDER BY id DESC LIMIT 1), 'Assets that cannot be converted into cash', FALSE),
((SELECT id FROM assessments_question WHERE name='What are current assets?' ORDER BY id DESC LIMIT 1), 'Assets that have no monetary value', FALSE);

-- Question 6
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is depreciation?' ORDER BY id DESC LIMIT 1), 'The allocation of the cost of an asset over its useful life', TRUE),
((SELECT id FROM assessments_question WHERE name='What is depreciation?' ORDER BY id DESC LIMIT 1), 'The process of selling an asset', FALSE),
((SELECT id FROM assessments_question WHERE name='What is depreciation?' ORDER BY id DESC LIMIT 1), 'The increase in value of an asset over time', FALSE),
((SELECT id FROM assessments_question WHERE name='What is depreciation?' ORDER BY id DESC LIMIT 1), 'The removal of an asset from the balance sheet', FALSE);

-- Question 7
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the difference between accounts payable and accounts receivable?' ORDER BY id DESC LIMIT 1), 'Accounts payable are amounts a company owes, accounts receivable are amounts owed to the company', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the difference between accounts payable and accounts receivable?' ORDER BY id DESC LIMIT 1), 'Accounts payable are amounts owed to the company, accounts receivable are amounts a company owes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between accounts payable and accounts receivable?' ORDER BY id DESC LIMIT 1), 'Both accounts payable and receivable are amounts a company owes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between accounts payable and accounts receivable?' ORDER BY id DESC LIMIT 1), 'Both accounts payable and receivable are amounts owed to the company', FALSE);

-- Question 8
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a trial balance?' ORDER BY id DESC LIMIT 1), 'A statement of all debits and credits in a double-entry account book, with any disagreement indicating an error', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a trial balance?' ORDER BY id DESC LIMIT 1), 'A list of all accounts used by a company', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a trial balance?' ORDER BY id DESC LIMIT 1), 'A statement showing the financial position of a company', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a trial balance?' ORDER BY id DESC LIMIT 1), 'A summary of income and expenses', FALSE);

-- Question 9
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is accrual accounting?' ORDER BY id DESC LIMIT 1), 'Accounting method that records revenues and expenses when they are incurred, regardless of when cash is exchanged', TRUE),
((SELECT id FROM assessments_question WHERE name='What is accrual accounting?' ORDER BY id DESC LIMIT 1), 'Accounting method that records revenues and expenses only when cash is exchanged', FALSE),
((SELECT id FROM assessments_question WHERE name='What is accrual accounting?' ORDER BY id DESC LIMIT 1), 'Accounting method that uses a cash basis', FALSE),
((SELECT id FROM assessments_question WHERE name='What is accrual accounting?' ORDER BY id DESC LIMIT 1), 'Accounting method that records transactions in the future', FALSE);

-- Question 10
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a balance sheet?' ORDER BY id DESC LIMIT 1), 'A financial statement that reports a company''s assets, liabilities, and shareholders'' equity at a specific point in time', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a balance sheet?' ORDER BY id DESC LIMIT 1), 'A statement that shows the company''s income and expenses', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a balance sheet?' ORDER BY id DESC LIMIT 1), 'A summary of the company''s cash flows', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a balance sheet?' ORDER BY id DESC LIMIT 1), 'A report on the company''s budget', FALSE);

-- Question 11
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are liabilities?' ORDER BY id DESC LIMIT 1), 'Amounts a company owes to others', TRUE),
((SELECT id FROM assessments_question WHERE name='What are liabilities?' ORDER BY id DESC LIMIT 1), 'Amounts a company is owed by others', FALSE),
((SELECT id FROM assessments_question WHERE name='What are liabilities?' ORDER BY id DESC LIMIT 1), 'Company''s net worth', FALSE),
((SELECT id FROM assessments_question WHERE name='What are liabilities?' ORDER BY id DESC LIMIT 1), 'Company''s profit', FALSE);

-- Question 12
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is equity?' ORDER BY id DESC LIMIT 1), 'The value of the owner''s interest in the company', TRUE),
((SELECT id FROM assessments_question WHERE name='What is equity?' ORDER BY id DESC LIMIT 1), 'The company''s debt', FALSE),
((SELECT id FROM assessments_question WHERE name='What is equity?' ORDER BY id DESC LIMIT 1), 'The company''s revenue', FALSE),
((SELECT id FROM assessments_question WHERE name='What is equity?' ORDER BY id DESC LIMIT 1), 'The company''s expenses', FALSE);

-- Question 13
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the purpose of an income statement?' ORDER BY id DESC LIMIT 1), 'To show the company''s revenues and expenses over a period of time', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of an income statement?' ORDER BY id DESC LIMIT 1), 'To show the company''s assets and liabilities', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of an income statement?' ORDER BY id DESC LIMIT 1), 'To show the company''s cash flow', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of an income statement?' ORDER BY id DESC LIMIT 1), 'To show the company''s equity', FALSE);

-- Question 14
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the matching principle?' ORDER BY id DESC LIMIT 1), 'Expenses should be matched with the revenues they help to generate', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the matching principle?' ORDER BY id DESC LIMIT 1), 'Revenues should be recorded when earned, regardless of when received', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the matching principle?' ORDER BY id DESC LIMIT 1), 'Expenses should be recorded when incurred, regardless of when paid', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the matching principle?' ORDER BY id DESC LIMIT 1), 'Assets should be matched with liabilities', FALSE);

-- Question 15
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the revenue recognition principle?' ORDER BY id DESC LIMIT 1), 'Revenue should be recognized when earned, regardless of when received', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the revenue recognition principle?' ORDER BY id DESC LIMIT 1), 'Revenue should be recognized when cash is received', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the revenue recognition principle?' ORDER BY id DESC LIMIT 1), 'Revenue should be recognized at the end of the fiscal year', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the revenue recognition principle?' ORDER BY id DESC LIMIT 1), 'Revenue should be recognized when an invoice is sent', FALSE);

-- Question 16
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the difference between cash basis and accrual basis accounting?' ORDER BY id DESC LIMIT 1), 'Cash basis records transactions when cash is exchanged, accrual basis records transactions when they are incurred', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the difference between cash basis and accrual basis accounting?' ORDER BY id DESC LIMIT 1), 'Cash basis records transactions when they are incurred, accrual basis records transactions when cash is exchanged', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between cash basis and accrual basis accounting?' ORDER BY id DESC LIMIT 1), 'Cash basis is used for tax purposes, accrual basis is used for financial reporting', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between cash basis and accrual basis accounting?' ORDER BY id DESC LIMIT 1), 'There is no difference', FALSE);

-- Question 17
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a general journal?' ORDER BY id DESC LIMIT 1), 'A chronological record of all company transactions', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a general journal?' ORDER BY id DESC LIMIT 1), 'A list of all company accounts', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a general journal?' ORDER BY id DESC LIMIT 1), 'A report on the company''s financial position', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a general journal?' ORDER BY id DESC LIMIT 1), 'A summary of income and expenses', FALSE);

-- Question 18
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a fiscal year?' ORDER BY id DESC LIMIT 1), 'A one-year period that companies use for financial reporting and budgeting', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a fiscal year?' ORDER BY id DESC LIMIT 1), 'A calendar year', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a fiscal year?' ORDER BY id DESC LIMIT 1), 'A two-year period for tax purposes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a fiscal year?' ORDER BY id DESC LIMIT 1), 'A three-month period for quarterly reporting', FALSE);

-- Question 19
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a chart of accounts?' ORDER BY id DESC LIMIT 1), 'A listing of all the accounts in the general ledger', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a chart of accounts?' ORDER BY id DESC LIMIT 1), 'A summary of the company''s assets and liabilities', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a chart of accounts?' ORDER BY id DESC LIMIT 1), 'A list of the company''s expenses', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a chart of accounts?' ORDER BY id DESC LIMIT 1), 'A report on the company''s cash flow', FALSE);

-- Question 20
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' ORDER BY id DESC LIMIT 1), 'To zero out temporary accounts and transfer their balances to permanent accounts', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' ORDER BY id DESC LIMIT 1), 'To adjust the company''s financial statements', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' ORDER BY id DESC LIMIT 1), 'To record new transactions', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of closing entries?' ORDER BY id DESC LIMIT 1), 'To finalize account balances for the next period', FALSE);

COMMIT;

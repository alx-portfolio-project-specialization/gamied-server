-- Insert data into existing tables
START TRANSACTION;

-- Exam start ---
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


-- Exam start ---
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

-- Exam start ---
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('Business Management Exam', 'exam', 75, 'Comprehensive exam on Business Management concepts and practices.', NULL, NULL, 60);

-- Insert questions for the assessment
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the role of a manager?', 20),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is SWOT analysis?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What are the four functions of management?', 20),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the difference between leadership and management?', 60),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is strategic planning?', 80),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the importance of organizational culture?', 20),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What are the types of business ownership?', 60),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is change management?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the role of HR in a company?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is market segmentation?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the importance of financial management?', 60),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is business ethics?', 80),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the purpose of a business plan?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is decision-making process?', 20),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What are the key components of supply chain management?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is risk management?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the role of innovation in business?', 20),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What are the characteristics of a good leader?', 40),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is the importance of customer relationship management (CRM)?', 20),
((SELECT id FROM assessments_assessment WHERE title='Business Management Exam' LIMIT 1), 'What is project management?', 20);

-- Insert answers for each question

-- Question 1
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the role of a manager?' ORDER BY id DESC LIMIT 1), 'To make decisions and oversee operations', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the role of a manager?' ORDER BY id DESC LIMIT 1), 'To follow employee instructions', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the role of a manager?' ORDER BY id DESC LIMIT 1), 'To work independently without any team', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the role of a manager?' ORDER BY id DESC LIMIT 1), 'To ignore company goals', FALSE);

-- Question 2
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is SWOT analysis?' ORDER BY id DESC LIMIT 1), 'A method to analyze strengths, weaknesses, opportunities, and threats', TRUE),
((SELECT id FROM assessments_question WHERE name='What is SWOT analysis?' ORDER BY id DESC LIMIT 1), 'A technique for market research', FALSE),
((SELECT id FROM assessments_question WHERE name='What is SWOT analysis?' ORDER BY id DESC LIMIT 1), 'A tool for financial analysis', FALSE),
((SELECT id FROM assessments_question WHERE name='What is SWOT analysis?' ORDER BY id DESC LIMIT 1), 'A way to manage employees', FALSE);

-- Question 3
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are the four functions of management?' ORDER BY id DESC LIMIT 1), 'Planning, organizing, leading, and controlling', TRUE),
((SELECT id FROM assessments_question WHERE name='What are the four functions of management?' ORDER BY id DESC LIMIT 1), 'Planning, marketing, selling, and financing', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the four functions of management?' ORDER BY id DESC LIMIT 1), 'Organizing, staffing, directing, and reporting', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the four functions of management?' ORDER BY id DESC LIMIT 1), 'Planning, producing, marketing, and controlling', FALSE);

-- Question 4
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the difference between leadership and management?' ORDER BY id DESC LIMIT 1), 'Leadership involves inspiring, while management involves planning and organizing', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the difference between leadership and management?' ORDER BY id DESC LIMIT 1), 'Leadership involves controlling, while management involves following', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between leadership and management?' ORDER BY id DESC LIMIT 1), 'Leadership and management are the same', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between leadership and management?' ORDER BY id DESC LIMIT 1), 'Leadership involves marketing, while management involves finance', FALSE);

-- Question 5
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is strategic planning?' ORDER BY id DESC LIMIT 1), 'The process of defining a company''s direction and making decisions on allocating resources', TRUE),
((SELECT id FROM assessments_question WHERE name='What is strategic planning?' ORDER BY id DESC LIMIT 1), 'A short-term financial planning', FALSE),
((SELECT id FROM assessments_question WHERE name='What is strategic planning?' ORDER BY id DESC LIMIT 1), 'A process for daily operations management', FALSE),
((SELECT id FROM assessments_question WHERE name='What is strategic planning?' ORDER BY id DESC LIMIT 1), 'A method to manage employee tasks', FALSE);

-- Question 6
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the importance of organizational culture?' ORDER BY id DESC LIMIT 1), 'It defines the values, beliefs, and behaviors that determine how employees interact', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the importance of organizational culture?' ORDER BY id DESC LIMIT 1), 'It is irrelevant in modern business', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the importance of organizational culture?' ORDER BY id DESC LIMIT 1), 'It only applies to large corporations', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the importance of organizational culture?' ORDER BY id DESC LIMIT 1), 'It is a concept used only in marketing', FALSE);

-- Question 7
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are the types of business ownership?' ORDER BY id DESC LIMIT 1), 'Sole proprietorship, partnership, corporation, LLC', TRUE),
((SELECT id FROM assessments_question WHERE name='What are the types of business ownership?' ORDER BY id DESC LIMIT 1), 'Sole proprietorship, corporation, non-profit', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the types of business ownership?' ORDER BY id DESC LIMIT 1), 'Partnership, LLC, franchise', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the types of business ownership?' ORDER BY id DESC LIMIT 1), 'Corporation, sole proprietorship, partnership', FALSE);

-- Question 8
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is change management?' ORDER BY id DESC LIMIT 1), 'The process of helping individuals and teams adapt to organizational change', TRUE),
((SELECT id FROM assessments_question WHERE name='What is change management?' ORDER BY id DESC LIMIT 1), 'A strategy for financial planning', FALSE),
((SELECT id FROM assessments_question WHERE name='What is change management?' ORDER BY id DESC LIMIT 1), 'A method to manage customer relationships', FALSE),
((SELECT id FROM assessments_question WHERE name='What is change management?' ORDER BY id DESC LIMIT 1), 'A process for inventory control', FALSE);

-- Question 9
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the role of HR in a company?' ORDER BY id DESC LIMIT 1), 'To recruit, hire, and manage employee relations', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the role of HR in a company?' ORDER BY id DESC LIMIT 1), 'To manage company finances', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the role of HR in a company?' ORDER BY id DESC LIMIT 1), 'To develop marketing strategies', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the role of HR in a company?' ORDER BY id DESC LIMIT 1), 'To oversee production processes', FALSE);

-- Question 10
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is market segmentation?' ORDER BY id DESC LIMIT 1), 'The process of dividing a market into distinct groups of buyers', TRUE),
((SELECT id FROM assessments_question WHERE name='What is market segmentation?' ORDER BY id DESC LIMIT 1), 'A strategy for financial investment', FALSE),
((SELECT id FROM assessments_question WHERE name='What is market segmentation?' ORDER BY id DESC LIMIT 1), 'A method to manage employee performance', FALSE),
((SELECT id FROM assessments_question WHERE name='What is market segmentation?' ORDER BY id DESC LIMIT 1), 'A technique for production planning', FALSE);

-- Question 11
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the importance of financial management?' ORDER BY id DESC LIMIT 1), 'It ensures efficient and effective management of money', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the importance of financial management?' ORDER BY id DESC LIMIT 1), 'It is not necessary for small businesses', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the importance of financial management?' ORDER BY id DESC LIMIT 1), 'It only applies to large companies', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the importance of financial management?' ORDER BY id DESC LIMIT 1), 'It is a function of HR', FALSE);

-- Question 12
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is business ethics?' ORDER BY id DESC LIMIT 1), 'Principles and standards that determine acceptable conduct in business', TRUE),
((SELECT id FROM assessments_question WHERE name='What is business ethics?' ORDER BY id DESC LIMIT 1), 'A method to increase sales', FALSE),
((SELECT id FROM assessments_question WHERE name='What is business ethics?' ORDER BY id DESC LIMIT 1), 'A strategy for marketing', FALSE),
((SELECT id FROM assessments_question WHERE name='What is business ethics?' ORDER BY id DESC LIMIT 1), 'A financial accounting technique', FALSE);

-- Question 13
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the purpose of a business plan?' ORDER BY id DESC LIMIT 1), 'To outline business goals and the strategy to achieve them', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of a business plan?' ORDER BY id DESC LIMIT 1), 'To calculate taxes', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of a business plan?' ORDER BY id DESC LIMIT 1), 'To manage daily tasks', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of a business plan?' ORDER BY id DESC LIMIT 1), 'To recruit employees', FALSE);

-- Question 14
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is decision-making process?' ORDER BY id DESC LIMIT 1), 'A series of steps to identify and evaluate options and make a choice', TRUE),
((SELECT id FROM assessments_question WHERE name='What is decision-making process?' ORDER BY id DESC LIMIT 1), 'A financial planning strategy', FALSE),
((SELECT id FROM assessments_question WHERE name='What is decision-making process?' ORDER BY id DESC LIMIT 1), 'A technique to manage employees', FALSE),
((SELECT id FROM assessments_question WHERE name='What is decision-making process?' ORDER BY id DESC LIMIT 1), 'A method to segment markets', FALSE);

-- Question 15
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are the key components of supply chain management?' ORDER BY id DESC LIMIT 1), 'Planning, sourcing, manufacturing, delivery, and returns', TRUE),
((SELECT id FROM assessments_question WHERE name='What are the key components of supply chain management?' ORDER BY id DESC LIMIT 1), 'Planning, marketing, sales, and finance', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the key components of supply chain management?' ORDER BY id DESC LIMIT 1), 'Production, HR, marketing, and sales', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the key components of supply chain management?' ORDER BY id DESC LIMIT 1), 'Marketing, sales, and customer service', FALSE);

-- Question 16
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is risk management?' ORDER BY id DESC LIMIT 1), 'The process of identifying, assessing, and controlling threats', TRUE),
((SELECT id FROM assessments_question WHERE name='What is risk management?' ORDER BY id DESC LIMIT 1), 'A method to increase sales', FALSE),
((SELECT id FROM assessments_question WHERE name='What is risk management?' ORDER BY id DESC LIMIT 1), 'A technique for managing employees', FALSE),
((SELECT id FROM assessments_question WHERE name='What is risk management?' ORDER BY id DESC LIMIT 1), 'A strategy for financial investment', FALSE);

-- Question 17
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the role of innovation in business?' ORDER BY id DESC LIMIT 1), 'To create new products and services and improve existing ones', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the role of innovation in business?' ORDER BY id DESC LIMIT 1), 'To eliminate competition', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the role of innovation in business?' ORDER BY id DESC LIMIT 1), 'To reduce costs', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the role of innovation in business?' ORDER BY id DESC LIMIT 1), 'To manage HR functions', FALSE);

-- Question 18
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are the characteristics of a good leader?' ORDER BY id DESC LIMIT 1), 'Vision, integrity, inspiration, and effective communication', TRUE),
((SELECT id FROM assessments_question WHERE name='What are the characteristics of a good leader?' ORDER BY id DESC LIMIT 1), 'Dominance, strictness, and autocracy', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the characteristics of a good leader?' ORDER BY id DESC LIMIT 1), 'Financial expertise and technical skills', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the characteristics of a good leader?' ORDER BY id DESC LIMIT 1), 'Marketing and sales skills', FALSE);

-- Question 19
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the importance of customer relationship management (CRM)?' ORDER BY id DESC LIMIT 1), 'To manage company''s interactions with current and potential customers', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the importance of customer relationship management (CRM)?' ORDER BY id DESC LIMIT 1), 'To handle employee relations', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the importance of customer relationship management (CRM)?' ORDER BY id DESC LIMIT 1), 'To manage supply chain', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the importance of customer relationship management (CRM)?' ORDER BY id DESC LIMIT 1), 'To oversee financial transactions', FALSE);

-- Question 20
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is project management?' ORDER BY id DESC LIMIT 1), 'The process of planning, organizing, and managing resources to achieve specific goals', TRUE),
((SELECT id FROM assessments_question WHERE name='What is project management?' ORDER BY id DESC LIMIT 1), 'A method to manage HR activities', FALSE),
((SELECT id FROM assessments_question WHERE name='What is project management?' ORDER BY id DESC LIMIT 1), 'A strategy for financial planning', FALSE),
((SELECT id FROM assessments_question WHERE name='What is project management?' ORDER BY id DESC LIMIT 1), 'A technique for marketing', FALSE);

-- Exam Start
INSERT INTO assessments_assessment (title, type, pass_mark, description, thumbnail, lesson_id, time_allowed) VALUES
('JavaScript Exam', 'exam', 75, 'Comprehensive exam on JavaScript programming concepts and practices.', NULL, NULL, 60);

-- Insert questions for the assessment
INSERT INTO assessments_question (assessment_id, name, points) VALUES
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is a variable in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'How do you declare a variable in JavaScript?', 40),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What are the data types in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is an array in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'How do you create a function in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is an object in JavaScript?', 80),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'How do you add an element to an array in JavaScript?', 40),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is the difference between let and var?', 20),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'How do you remove an element from an array in JavaScript?', 40),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is a promise in JavaScript?', 80),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'How do you handle exceptions in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is the purpose of the this keyword in JavaScript?', 40),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is a callback function?', 20),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is event bubbling?', 80),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is closure in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'How do you convert a string to a number in JavaScript?', 60),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is the difference between == and ===?', 80),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is JSON?', 80),
((SELECT id FROM assessments_assessment WHERE title='JavaScript Exam' LIMIT 1), 'What is the DOM in JavaScript?', 60);

-- Insert answers for each question

-- Question 1
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is JavaScript?' ORDER BY id DESC LIMIT 1), 'A programming language for web development', TRUE),
((SELECT id FROM assessments_question WHERE name='What is JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of database', FALSE),
((SELECT id FROM assessments_question WHERE name='What is JavaScript?' ORDER BY id DESC LIMIT 1), 'A stylesheet language', FALSE),
((SELECT id FROM assessments_question WHERE name='What is JavaScript?' ORDER BY id DESC LIMIT 1), 'A web browser', FALSE);

-- Question 2
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'A container for storing data values', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'A kind of loop', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'A property of an object', FALSE);

-- Question 3
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you declare a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'var variableName;', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you declare a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'variable variableName;', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you declare a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'declare variableName;', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you declare a variable in JavaScript?' ORDER BY id DESC LIMIT 1), 'def variableName;', FALSE);

-- Question 4
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What are the data types in JavaScript?' ORDER BY id DESC LIMIT 1), 'Number, String, Boolean, Object, Undefined', TRUE),
((SELECT id FROM assessments_question WHERE name='What are the data types in JavaScript?' ORDER BY id DESC LIMIT 1), 'Number, Character, String, Boolean, Object', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the data types in JavaScript?' ORDER BY id DESC LIMIT 1), 'Integer, String, Boolean, Object, Null', FALSE),
((SELECT id FROM assessments_question WHERE name='What are the data types in JavaScript?' ORDER BY id DESC LIMIT 1), 'Float, String, Boolean, Object, Undefined', FALSE);

-- Question 5
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'An ordered list of values', TRUE),
((SELECT id FROM assessments_question WHERE name='What is an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'A method to store key-value pairs', FALSE),
((SELECT id FROM assessments_question WHERE name='What is an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of loop', FALSE);

-- Question 6
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you create a function in JavaScript?' ORDER BY id DESC LIMIT 1), 'function myFunction() {}', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you create a function in JavaScript?' ORDER BY id DESC LIMIT 1), 'def myFunction() {}', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a function in JavaScript?' ORDER BY id DESC LIMIT 1), 'function: myFunction() {}', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you create a function in JavaScript?' ORDER BY id DESC LIMIT 1), 'func myFunction() {}', FALSE);

-- Question 7
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is an object in JavaScript?' ORDER BY id DESC LIMIT 1), 'A collection of properties', TRUE),
((SELECT id FROM assessments_question WHERE name='What is an object in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is an object in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of array', FALSE),
((SELECT id FROM assessments_question WHERE name='What is an object in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of loop', FALSE);

-- Question 8
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you add an element to an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.push(element)', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you add an element to an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.add(element)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you add an element to an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.insert(element)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you add an element to an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.append(element)', FALSE);

-- Question 9
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the difference between let and var?' ORDER BY id DESC LIMIT 1), 'let has block scope, var has function scope', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the difference between let and var?' ORDER BY id DESC LIMIT 1), 'let is for constants, var is for variables', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between let and var?' ORDER BY id DESC LIMIT 1), 'let is for arrays, var is for objects', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between let and var?' ORDER BY id DESC LIMIT 1), 'let is a newer version of var', FALSE);

-- Question 10
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you remove an element from an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.splice(index, 1)', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you remove an element from an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.delete(index)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you remove an element from an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.remove(index)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you remove an element from an array in JavaScript?' ORDER BY id DESC LIMIT 1), 'array.clear(index)', FALSE);

-- Question 11
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a promise in JavaScript?' ORDER BY id DESC LIMIT 1), 'An object representing the eventual completion or failure of an asynchronous operation', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a promise in JavaScript?' ORDER BY id DESC LIMIT 1), 'A method to store data', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a promise in JavaScript?' ORDER BY id DESC LIMIT 1), 'A type of function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a promise in JavaScript?' ORDER BY id DESC LIMIT 1), 'A method to create loops', FALSE);

-- Question 12
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in JavaScript?' ORDER BY id DESC LIMIT 1), 'try...catch', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in JavaScript?' ORDER BY id DESC LIMIT 1), 'try...except', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in JavaScript?' ORDER BY id DESC LIMIT 1), 'try...handle', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you handle exceptions in JavaScript?' ORDER BY id DESC LIMIT 1), 'try...rescue', FALSE);

-- Question 13
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the purpose of the this keyword in JavaScript?' ORDER BY id DESC LIMIT 1), 'To refer to the current object', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the this keyword in JavaScript?' ORDER BY id DESC LIMIT 1), 'To refer to the global object', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the this keyword in JavaScript?' ORDER BY id DESC LIMIT 1), 'To refer to the previous object', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the purpose of the this keyword in JavaScript?' ORDER BY id DESC LIMIT 1), 'To refer to the function itself', FALSE);

-- Question 14
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is a callback function?' ORDER BY id DESC LIMIT 1), 'A function passed into another function as an argument', TRUE),
((SELECT id FROM assessments_question WHERE name='What is a callback function?' ORDER BY id DESC LIMIT 1), 'A function that calls itself', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a callback function?' ORDER BY id DESC LIMIT 1), 'A function that returns a value', FALSE),
((SELECT id FROM assessments_question WHERE name='What is a callback function?' ORDER BY id DESC LIMIT 1), 'A function that is called once', FALSE);

-- Question 15
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is event bubbling?' ORDER BY id DESC LIMIT 1), 'When an event starts from the target element and propagates up to the root', TRUE),
((SELECT id FROM assessments_question WHERE name='What is event bubbling?' ORDER BY id DESC LIMIT 1), 'When an event starts from the root and propagates down to the target element', FALSE),
((SELECT id FROM assessments_question WHERE name='What is event bubbling?' ORDER BY id DESC LIMIT 1), 'When an event is prevented from propagating', FALSE),
((SELECT id FROM assessments_question WHERE name='What is event bubbling?' ORDER BY id DESC LIMIT 1), 'When an event is canceled', FALSE);

-- Question 16
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is closure in JavaScript?' ORDER BY id DESC LIMIT 1), 'A function that retains access to its lexical scope even when invoked outside that scope', TRUE),
((SELECT id FROM assessments_question WHERE name='What is closure in JavaScript?' ORDER BY id DESC LIMIT 1), 'A function that returns another function', FALSE),
((SELECT id FROM assessments_question WHERE name='What is closure in JavaScript?' ORDER BY id DESC LIMIT 1), 'A function that calls itself', FALSE),
((SELECT id FROM assessments_question WHERE name='What is closure in JavaScript?' ORDER BY id DESC LIMIT 1), 'A function that does not return a value', FALSE);

-- Question 17
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='How do you convert a string to a number in JavaScript?' ORDER BY id DESC LIMIT 1), 'Number(string)', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you convert a string to a number in JavaScript?' ORDER BY id DESC LIMIT 1), 'parseInt(string)', TRUE),
((SELECT id FROM assessments_question WHERE name='How do you convert a string to a number in JavaScript?' ORDER BY id DESC LIMIT 1), 'int(string)', FALSE),
((SELECT id FROM assessments_question WHERE name='How do you convert a string to a number in JavaScript?' ORDER BY id DESC LIMIT 1), 'toNumber(string)', FALSE);

-- Question 18
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the difference between == and ===?' ORDER BY id DESC LIMIT 1), '== compares values, === compares values and types', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the difference between == and ===?' ORDER BY id DESC LIMIT 1), '== is for comparison, === is for assignment', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between == and ===?' ORDER BY id DESC LIMIT 1), '== is for strings, === is for numbers', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the difference between == and ===?' ORDER BY id DESC LIMIT 1), '== is for arrays, === is for objects', FALSE);

-- Question 19
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is JSON?' ORDER BY id DESC LIMIT 1), 'JavaScript Object Notation, a lightweight data-interchange format', TRUE),
((SELECT id FROM assessments_question WHERE name='What is JSON?' ORDER BY id DESC LIMIT 1), 'JavaScript Object Namespace', FALSE),
((SELECT id FROM assessments_question WHERE name='What is JSON?' ORDER BY id DESC LIMIT 1), 'JavaScript Operator Notation', FALSE),
((SELECT id FROM assessments_question WHERE name='What is JSON?' ORDER BY id DESC LIMIT 1), 'JavaScript Online Notation', FALSE);

-- Question 20
INSERT INTO assessments_answer (question_id, name, is_correct) VALUES
((SELECT id FROM assessments_question WHERE name='What is the DOM in JavaScript?' ORDER BY id DESC LIMIT 1), 'Document Object Model, a programming interface for HTML and XML documents', TRUE),
((SELECT id FROM assessments_question WHERE name='What is the DOM in JavaScript?' ORDER BY id DESC LIMIT 1), 'Data Object Model', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the DOM in JavaScript?' ORDER BY id DESC LIMIT 1), 'Document Online Model', FALSE),
((SELECT id FROM assessments_question WHERE name='What is the DOM in JavaScript?' ORDER BY id DESC LIMIT 1), 'Data Online Model', FALSE);

COMMIT;

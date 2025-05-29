Q1

MariaDB [db_lesson]> CREATE TABLE departments;
ERROR 1113 (42000): A table must have at least 1 column
MariaDB [db_lesson]>  CREATE TABLE departments(
     department_id INT unsigned  auto_increment PRIMARY KEY, 
     name VARCHAR(20) NOT null ,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     );
    
    Q2
    
    ALTER TABLE people ADD department_id INT unsigned AFTER email;
    
    Q3
    
    INSERT INTO departments (name)
    VALUES
     ('営業'),
     ('開発'),
     ('経理'),
     ('人事'),
     ('情報システム');
     INSERT INTO people (name,department_id)
     VALUES
     ('鈴木あみ',1),
     ('田中まい',1),
     ('中村さき',1),
     ('松本なな',2),
     ('坂本ゆう',2),
     ('吉田かな',2),
     ('松田あんな',2),
     ('佐々木つき',3),
     ('嶋田りな',4),
     ('古田さえ',5);
      UPDATE people SET email = 'suzukia@beyond-works.co.jp' WHERE person_id =7;
      UPDATE people SET email = 'tanakam@beyond-works.co.jp' WHERE person_id =8;
      UPDATE people SET email = 'nakamura@beyond-works.co.jp' WHERE person_id =9;
      UPDATE people SET email = 'matumoto@beyond-works.co.jp' WHERE person_id =10;
      UPDATE people SET email = 'sakamoto@beyond-works.co.jp' WHERE person_id =11;
      UPDATE people SET email = 'yosida@beyond-works.co.jp' WHERE person_id =12;
      UPDATE people SET email = 'matuda@beyond-works.co.jp' WHERE person_id =13;
      UPDATE people SET email = 'sasaki@beyond-works.co.jp' WHERE person_id =14;
      UPDATE people SET email = 'simada@beyond-works.co.jp' WHERE person_id =15;
      UPDATE people SET email = 'furuta@beyond-works.co.jp' WHERE person_id =16;

      
      UPDATE people SET age = '24' WHERE person_id =7;
      UPDATE people SET age = '29' WHERE person_id =8;
      UPDATE people SET age = '27' WHERE person_id =9;
      UPDATE people SET age = '24' WHERE person_id =10;
      UPDATE people SET age = '24' WHERE person_id =11;
      UPDATE people SET age = '30' WHERE person_id =12;
      UPDATE people SET age = '28' WHERE person_id =13;
      UPDATE people SET age = '28' WHERE person_id =14;
      UPDATE people SET age = '27' WHERE person_id =15;
      UPDATE people SET age = '24' WHERE person_id =16;

      UPDATE people SET gender = '2' WHERE person_id =7;
      UPDATE people SET gender = '2' WHERE person_id =8;
      UPDATE people SET gender = '2' WHERE person_id =9;
      UPDATE people SET gender = '2' WHERE person_id =10;
      UPDATE people SET gender = '2' WHERE person_id =11;
      UPDATE people SET gender = '2' WHERE person_id =12;
      UPDATE people SET gender = '2' WHERE person_id =13;
      UPDATE people SET gender = '2' WHERE person_id =14;
      UPDATE people SET gender = '2' WHERE person_id =15;
      UPDATE people SET gender = '2' WHERE person_id =16;


      INSERT INTO reports (person_id,content)
      VALUES
      (7,'日報11'),
      (8,'日報12'),
      (9,'日報13'),
      (10,'日報14'),
      (11,'日報15'),
      (12,'日報16'),
      (13,'日報17'),
      (14,'日報18'),
      (15,'日報19'),
      (16,'日報20');

      Q4


      UPDATE people SET department_id = '5' WHERE person_id =1;
      UPDATE people SET department_id = '4' WHERE person_id =2;
      UPDATE people SET department_id = '5' WHERE person_id =3;
      UPDATE people SET department_id = '4' WHERE person_id =4;
      UPDATE people SET department_id = '5' WHERE person_id =6;
      
      Q5


      SELECT name,age FROM people WHERE gender=1 ORDER BY age DESC;


      Q6
      SELECT
      `name`, `email`, `age`
      FROM
      `people`
      WHERE
      `department_id` = 1
      ORDER BY
      `created_at`;

      peopleテーブルから、department_idが1のname,email,ageを選択し、created_atを基準に昇順に並べる

      Q7

      SELECT name FROM people WHERE (`gender` = 2 AND `age` BETWEEN 20 AND 29) OR (`gender` = 1 AND `age` BETWEEN 40 AND 49);
      

      Q8
      SELECT name age FROM people WHERE department_id = 1 ORDER BY age ASC;

      Q9
      SELECT AVG(age) AS average_age FROM people WHERE department = '2' AND gender = 2;

      Q10
      SELECT 
      reports.content,
      people.name,
      departments.name
      FROM 
      people
      INNER JOIN
      reports
      ON
      people.person_id = reports.person_id
      INNER JOIN
      departments
      ON
      people.department_id = departments.department_id
      WHERE
      reports.content
      IS NOT NULL;

      Q11

      SELECT
      people.name
      FROM
      people
      LEFT OUTER JOIN
      reports
      ON
      people.person_id = reports.person_id
      WHERE
      reports.content
      IS NULL;

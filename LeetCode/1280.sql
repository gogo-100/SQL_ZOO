# Write your MySQL query statement below

select stu.student_id,student_name,sub.subject_name,count(exam.subject_name)as attended_exams
from subjects sub
join students stu
left join examinations exam on sub.subject_name=exam.subject_name and stu.student_id=exam.student_id
group by stu.student_id,student_name,sub.subject_name
order by stu.student_id,sub.subject_name

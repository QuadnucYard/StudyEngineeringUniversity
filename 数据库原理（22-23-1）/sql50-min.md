# MySQL 经典练习 50 题（完美解答版）

## 表关系

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200623195359540.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dvZFN1enpa,size_16,color_FFFFFF,t_70)  

## 经典练习 50 题

### 1、查询"01"课程比"02"课程成绩高的学生的信息及课程分数

```sql
select s.*,sc1.s_score as score_01,sc2.s_score as score_02
from student s
inner join (
	select * from score where c_id = 1
) sc1
on s.s_id = sc1.s_id
inner join (
	select * from score where c_id = 2
) sc2
on s.s_id = sc2.s_id
where sc1.s_score > sc2.s_score;
```

### 2、查询"01"课程比"02"课程成绩低的学生的信息及课程分数

```sql
select s.*,sc1.s_score as score_01,sc2.s_score as score_02
from student s
inner join (
	select * from score where c_id = 1
) sc1
on s.s_id = sc1.s_id
inner join (
	select * from score where c_id = 2
) sc2
on s.s_id = sc2.s_id
where sc1.s_score < sc2.s_score;
```

### 3、查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩

```sql
select s.s_id,s.s_name,round(avg_score, 2) as avg_score
from student s
inner join (
	select s_id,avg(s_score) as avg_score
	from score
	group by s_id
	having avg_score >= 60
) t1
on s.s_id = t1.s_id;
```

### 4、查询平均成绩小于 60 分的同学的学生编号和学生姓名和平均成绩（包括有成绩的和无成绩的）

```sql
select s.s_id,s.s_name,ifnull(round(avg_score, 2), 0) as avg_score
from student s
left join (
	select s_id,avg(s_score) as avg_score
	from score
	group by s_id
) t1
on s.s_id = t1.s_id
where avg_score is null or avg_score < 60;
```

### 9、查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息

```sql
select s.*
from student s
where s_id in (
	select s_id
	from score
	where c_id in (1,2)
	group by s_id
	having count(*) = 2
);
```

### 11、查询没有学全所有课程的同学的信息

```sql
select *
from student
where s_id not in (
	select s_id
	from score
	group by s_id
	having count(*) = (
		select count(*) from course
	)
);
```

### 12、查询至少有一门课与学号为"01"的同学所学相同的同学的信息

```sql
select *
from student
where s_id in (
	select distinct s_id
	from score s
	inner join (
		select c_id from score where s_id = 1
	) t1
	on s.c_id = t1.c_id
);
```

### 13、查询和"01"号的同学学习的课程完全相同的其他同学的信息

```sql
select *
from student
where s_id in (
	 select s_id
	 from score s
	 inner join (
		select c_id from score where s_id = 1
	 ) t1
	 on s.c_id = t1.c_id
	 where s_id != 1
	 group by s_id having count(*) = (
		select count(*) from score where s_id = 1
	 )
);
```

### 14、查询没学过"张三"老师讲授的任一门课程的学生姓名

```sql
select s_name
from student
where s_id not in (
	select s_id
	from score sc
	inner join (
		select c_id
		from course c
		inner join teacher t on c.t_id = t.t_id
		where t_name = '张三'
	) t1
	on sc.c_id = t1.c_id
);
```

### 15、查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩

```sql
select s.s_id,s.s_name,round(avg(s_score), 2) as avg_score
from student s
inner join (
	select s_id
	from score
	where s_score < 60
	group by s_id
	having count(*) >= 2
) t1
on s.s_id = t1.s_id
inner join score sc on s.s_id = sc.s_id
group by s.s_id;
```

### 16、检索"01"课程分数小于 60，按分数降序排列的学生信息

```sql
select s.*,s_score as score_01
from student s
inner join (
	select s_id,s_score
	from score
	where c_id = 1
	and s_score < 60
) t1
on s.s_id = t1.s_id
order by score_01 desc;
```

### 17、按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩

```sql
select
	s.s_id as 学号，s.s_name as 姓名，
	sum(case c_id when 1 then s_score else 0 end) as 语文，
	sum(case c_id when 2 then s_score else 0 end) as 数学，
	sum(case c_id when 3 then s_score else 0 end) as 英语，
	ifnull(round(avg(s_score), 2), 0) as 平均成绩
from student s
left join score sc on s.s_id = sc.s_id
group by s.s_id
order by 平均成绩 desc;
```

### 21、查询不同老师所教不同课程平均分从高到低显示

```sql
select t.t_id,t.t_name,c.c_id,c.c_name,round(avg(s_score), 2) as avg_score
from score sc
inner join course c on sc.c_id = c.c_id
inner join teacher t on t.t_id = c.t_id
group by t.t_id,c.c_id
order by t.t_id,avg_score desc;
```

### 25、查询各科成绩前三名的记录

```sql
select c.c_id,c.c_name,s.s_id,s.s_name,s_score
from (
	select *
	from score sc
	where (
		select count(*)
		from score sc1
		where sc.c_id = sc1.c_id
		and sc.s_score < sc1.s_score
	) < 3
)
t1
inner join student s on t1.s_id = s.s_id 
inner join course c on t1.c_id = c.c_id 
order by c.c_id,s_score desc;
```

### 26、查询每门课程被选修的学生数

```sql
select c.c_id,c.c_name,cnt_student
from course c
inner join (
	select c_id,count(*) as cnt_student
	from score
	group by c_id
) t1
on c.c_id = t1.c_id;
```

### 29、查询名字中含有"风"字的学生信息

```sql
select *
from student
where s_name like '%风%';
```

### 31、查询 1990 年出生的学生名单

```sql
select *
from student
where year(s_birth) = '1990';
```

### 32、查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

```sql
select c.c_id,c.c_name,avg_score
from course c
inner join (
	select c_id,round(avg(s_score), 2) as avg_score
	from score
	group by c_id
) t1
on c.c_id = t1.c_id
order by avg_score desc,c.c_id;
```

### 33、查询平均成绩大于等于 85 的所有学生的学号、姓名和平均成绩

```sql
select s.s_id,s.s_name,avg_score
from student s
inner join (
	select s_id,round(avg(s_score), 2) as avg_score
	from score
	group by s_id
	having avg_score >= 85
) t1
on s.s_id = t1.s_id;
```

### 34、查询课程名称为"数学"，且分数低于 60 的学生姓名和分数

```sql
select s_name,s_score
from student s
inner join (
	select s_id,s_score
	from score sc
	inner join course c on sc.c_id = c.c_id
	where c_name = '数学'
	and s_score < 60
) t1
on s.s_id = t1.s_id;
```

### 35、查询所有学生的课程及分数情况

```sql
select
	s.s_id,s.s_name,
	sum(case c_id when 1 then s_score else 0 end) as 语文，
	sum(case c_id when 2 then s_score else 0 end) as 数学，
	sum(case c_id when 3 then s_score else 0 end) as 英语
from student s
left join score sc on s.s_id = sc.s_id
group by s.s_id;
```

### 40、查询选修"张三"老师所授课程的学生中，成绩最高的学生信息及其成绩

```sql
select s.*,s_score as max_score
from student s
inner join (
	select s_id,s_score
	from score sc
	inner join (
		select c_id
		from course c
		inner join teacher t on c.t_id = t.t_id
		where t_name = '张三'
	) t1
	on sc.c_id = t1.c_id
	order by s_score desc
	limit 1
) t2
on s.s_id = t2.s_id;
```

### 41、查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩

```sql
select *
from score
where s_score in (
	select s_score
	from score
	group by s_score
	having count(*) > 1
);
```

### 42、查询每门课程成绩最好的前三名

```sql
select c.c_id,c.c_name,s.s_id,s.s_name,s_score
from (
	select *
	from score sc
	where (
		select count(*)
		from score sc1
		where sc.c_id = sc1.c_id
		and sc.s_score < sc1.s_score
	) < 3
) t1
inner join student s on t1.s_id = s.s_id
inner join course c on t1.c_id = c.c_id
order by c.c_id,s_score desc;
```

### 43、统计每门课程的学生选修人数（超过 5 人的课程才统计）

要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列

```sql
select c.c_id,cnt_student
from course c
inner join (
	select c_id,count(*) as cnt_student
	from score
	group by c_id
	having cnt_student > 5
) t1
on c.c_id = t1.c_id
order by cnt_student desc,c.c_id;
```

### 45、查询选修了全部课程的学生信息

```sql
select *
from student
where s_id in (
	select s_id
	from score
	group by s_id
	having count(*) = (
		select count(*) from course
	)
);
```

<style>
pre {
	tab-size: 4 !important;
	page-break-before: avoid !important;
	page-break-after: avoid !important;
	page-break-inside: auto !important;
}
h3 {
	font-size: 100% !important;
}
</style>

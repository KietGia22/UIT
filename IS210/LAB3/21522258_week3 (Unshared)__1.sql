SET TRANSACTION NAME 'cost_update9';


Select * from project;
Update project set cost=298
Where pname='saturn';
Select * from project;
Select * from project;
Commit;
Select * from project;


%NUMBER 1%
%PART (a)%
% STUDENT PROFILE
student.name = input('enter your name','s');
student.registration_number =input('enter your registration number','s');
student.course = input('ente your course','s');
student.year_of_sudy = input('enter your year of study','s');
student.age = input('enter your age','s');
student.tribe = input('enter your tribe','s');
student.association = input("enter your association's name","s");
student.hall_or_hostel = input('enter your hostel','s');
student.friends = input('enter a lsit of your close friends','s');
student.phone_number = input('enter your phone number','s');
student.email = input('enter your email','s');
student.hobbies = input('enter your hobbies','s');
clc;
clear;

%PARTR (a)%
student_profile = readtable('C:\Users\user\Documents\student profile.xlsx');
% Outputting the information into a new excel sheeat
writetable(student_profile,'MEB Student Profile.xlsx');
% Plotting the information
% Age Distribution
names_cat = categorical(student_profile.StudentName,student_profile.StudentName);
n_age = student_profile.Age;
figure;
bar(names_cat,n_age);
title('Age Distribution');
xlabel('Age');
ylabel('Name of Students');
saveas(gcf,'Age_Distribution.png');

% Tribe Counts
tribe_counts = groupcounts(student_profile,'Tribe');
figure;
bar(categorical(tribe_counts.Tribe),tribe_counts.GroupCount);
title('Distribution by Tribe');
xlabel('Tribe');
ylabel('Count');
saveas(gcf,'Tribe Counts.png');

% Hobby Counts
hobby_counts = groupcounts(student_profile,'Hobbies');
figure;
bar(categorical(hobby_counts.Hobbies),hobby_counts.GroupCount);
title('Distribution Of Hobbies');
xlabel('Hobby');
ylabel('Count');
saveas(gcf,'Hobby Counts.png');

% Hostel Counts
hostel_counts = groupcounts(student_profile,'Hostel_Hall');
figure;
bar(categorical(hostel_counts.Hostel_Hall),hostel_counts.GroupCount);
title('Distribution by Hostel');
xlabel('Hostel');
ylabel('Count');
saveas(gcf,'Hostel Counts.png');

%NUMBER 2%
% name = input('enter your name','s');
registration_number = input('enter your registration number','s');
course = input('enter your course','s');

% Number of semesters
number_of_semesters = input('enter the number of semesters: ');
% CGPA Variables
total_quality_points = 0;
total_credit_units = 0;

% Store GPA for each semester
for semester = 1:number_of_semesters
    fprintf('\n Semester %d \n',semester);
    number_of_courses = input('enter number of courses: ');
    total_semester_points = 0;
    total_semester_credits = 0;
    for course_number = 1:number_of_courses
        fprintf('\nCourse %d\n',course_number);
        course_name = input('enter the course name','s');
        credit_unit = input('enter credit units: ');
        grade_point = input('enter grade point: ');
        
        % Calculating quality points
        quality_points = credit_unit * grade_point;
        
        % Add to semester totals
        total_semester_points = total_semester_points + quality_points;
        total_semester_credits = total_semester_credits + credit_unit;
        fprintf('%s: Quality Points = %2f\n',course_name,quality_points);
    end
    
    % Calculate semester GPA
    GPA = total_semester_points/total_semester_credits;
    semestergpa(semester) = GPA;
    semester_credits(semester) = total_semester_credits;
    
    %Add semester information to CGPA totals
    total_quality_points = total_quality_points + total_semester_points;
    total_credit_units = total_credit_units + total_semester_credits;
    fprintf('\nGPA for semester %d = %.2f\n',semester,GPA);
end
% Calculate CGPA
CGPA = total_quality_points/total_credit_units;

% Display final reuslts
fprintf('Name: %s\n',name);
fprintf('Registration Number: %s\n',registration_number);
fprintf('Course: %s\n',course);
fprintf('\nSemester GPAs:\n');
for semester = 1:number_of_semesters
    fprintf('Semeter %d: %.2f\n',semester,semestergpa(semester));
end
fprintf('\nTotal Credit Units:%.2f\n',total_credit_units);
fprintf('CGPA: %.2f\n',CGPA);

--- SIMPLE 4 PLOTS SECTION ---
% Figure 1: Simple Line Graph for progression
figure(1);
plot(semestergpa);
title('GPA Line Graph');
xlabel('Semester');
ylabel('GPA');

% Figure 2: Simple Bar Chart for semester breakdown
figure(2);
bar(semestergpa);
title('GPA Bar Chart');
xlabel('Semester');
ylabel('GPA');

% Figure 3: Simple Credit Hour Chart
figure(3);
bar(semester_credits);
title('Credit Units Registered');
xlabel('Semester');
ylabel('Credits');

% Figure 4: Simple Comparison (Semesters vs Final CGPA)
figure(4);
all_data = [semestergpa, CGPA];
bar(all_data);
title('All Semesters and Final CGPA');
ylabel('Grade Points');

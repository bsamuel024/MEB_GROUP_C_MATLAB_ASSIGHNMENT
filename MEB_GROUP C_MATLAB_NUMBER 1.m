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

student_profile = readtable('C:\Users\user\Documents\student profile.xlsx');
% Outputting the information into a new excel sheet
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

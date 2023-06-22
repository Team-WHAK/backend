user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")


tasks_first = [

{
    area: "Kitchen",
    item: "Refrigerator",
    picture: "https://cdn.pixabay.com/photo/2022/02/23/12/17/refrigerator-7030602_1280.png",
    task_name: "Defrost freezer",
    task_descr: "1. Empty all items and place in cooler with ice. 2. Open freezer door and unplug refrigerator 3. Place towel on ground to catch water. 4. Once completely thawed, clean inside of freezer with disinfectant",
    frequency: "annually",
    due_date: "14 July 2023",
},

]

tasks_second = [

{
    area: "Livining Room",
    item: "Fireplace",
    picture: "https://cdn.pixabay.com/photo/2016/06/17/21/33/fireplace-1464166_1280.jpg",
    task_name: "Clean the chimney",
    task_descr: "1. Conduct the safety check located in the manual. 2. Clear all items away from fireplace. 3. Schedule certified chimney sweeper.",
    frequency: "annually",
    due_date: "07 Aug 2023",
},
{
    area: "Laundry Room",
    item: "Washing Machine",
    picture: "https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/10/Hotpoint-Anti-Stain-NDB-9635-W-UK-1.jpg",
    task_name: "Run tub clean cycle",
    task_descr: "1. Ensure the washer machine is empty. 2. Add tub cleaner to appropriate recepticle. 3. Start 'Tub Cleaning Cycle' on the machine.",
    frequency: "monthly",
    due_date: "28 Aug 2023",
},

]

tasks_first.each do |task|
    user1.tasks.create(task)
    p "creating task #{task}"
end

tasks_second.each do |task|
    user2.tasks.create(task)
    p "creating task #{task}"
end
h_potter = Student.create(
    name: "Harry Potter",
    age: 12,
    house: "Gryffindor")

c_black = Student.create(
    name: "Casseopia Black",
    age: 14,
    house: "Syltherin")

n_longbottom = Student.create(
    name: "Nevil Longbottom",
    age: 13,
    house: "Gryffindor")

witchcraft = Course.create(name: "Witchcraft")
wizardry = Course.create(name: "Wizardry")
defense = Course.create(name: "Defense Against the Dark Arts")
potions = Course.create(name: "Potions")

c_black.courses << defense
h_potter.courses << defense
n_longbottom.courses << defense

h_potter.courses << wizardry
n_longbottom.courses << wizardry

c_black.courses << witchcraft

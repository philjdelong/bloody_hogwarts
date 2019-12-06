h_potter = Student.create(
    name: "Harry Potter",
    age: 12,
    house: "Gryffindor")

c_black = Student.create(
    name: "Casseopia Black",
    age: 14,
    house: "Syltherin")

wizardry = h_potter.courses.create(name: "Wizardry")

potions = h_potter.courses.create(name: "Potions")

witchcraft = c_black.courses.create(name: "Witchcraft")

defense = c_black.courses.create(name: "Defense Against the Dark Arts")

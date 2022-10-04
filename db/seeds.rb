@first_user = User.create(name: 'Worash')
@second_user = User.create(name: 'Tom')

@first_food = Food.create(name: 'Carrot', measurment_unint: 'Unit', quantity: 3, price: 1.5, user: @first_user)
@second_food = Food.create(name: 'Apple', measurment_unint: 'Unit', quantity: 5, price: 2, user: @second_user)

@first_recipe = Recipe.create(name: 'Carrot cake', preparation_time: 1.5, cooking_time: 0.75, description: 'A great carrot cake', user: @first_user)
@first_recipe = Recipe.create(name: 'Apple cake', preparation_time: 1.25, cooking_time: 1.00, description: 'A great carrot cake', user: @first_user)

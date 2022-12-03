import SwiftUI

struct Recipe: Identifiable {
    var id: Int
    var name: String
    var ingredients: [String]
    var instructions: [String]
}

struct RecipeList: View {
    var recipes: [Recipe]

    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                    Text(recipe.name)
                }
            }
            .navigationBarTitle("Recipes")
        }
    }
}

struct RecipeDetail: View {
    var recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.name)
                .font(.title)
                .padding()
            Text("Ingredients:")
                .font(.headline)
                .padding()
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text(ingredient)
                    .padding(.bottom)
            }
            Text("Instructions:")
                .font(.headline)
                .padding()
            ForEach(recipe.instructions, id: \.self) { instruction in
                Text(instruction)
                    .padding(.bottom)
            }
        }
    }
}

struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeList(recipes: [
                Recipe(id: 1, name: "Pancakes", ingredients: ["Flour", "Eggs", "Milk", "Butter"], instructions: ["Mix the flour, eggs, and milk together in a bowl.", "Heat a pan over medium heat and add a little butter.", "Pour a small amount of batter into the pan and cook until bubbles form on the surface.", "Flip the pancake and cook for another minute or so, until both sides are golden brown."]),
                Recipe(id: 2, name: "Omelette", ingredients: ["Eggs", "Cheese", "Ham", "Butter"], instructions: ["Beat the eggs in a bowl.", "Heat a pan over medium heat and add a little butter.", "Pour the eggs into the pan and cook until they start to set.", "Sprinkle the cheese and ham over one half of the omelette.", "Fold the omelette in half and cook for another minute or so, until the cheese is melted and the omelette is cooked through."])
            ])
        }
    }
}

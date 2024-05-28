import SwiftUI
struct MainTabbedView: View {
    
    //hello
    var Classes = ["AP Human Geo", "Algebra", "Biology", "Spanish", "WOC"]
    @State var selectedClass = "Algebra"
    @State var newAssignment = ""
    @State var dueDate = Date.now
    @State var showDatePicker: Bool = false
    @State var assignments: [String] = []
    @State var day = "Monday"
    @State var tuesday1 = ""
    @State var tuesday: [String] = []

    @State var wednesday: [String] = []
    @State var thursday: [String] = []
    @State var friday: [String] = []
    @State var saturday: [String] = []
    @State var sunday: [String] = []
    @State var monday: [String] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    var body: some View {
        VStack{
            ZStack{
                Text("Assignment Notebook")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            
            Divider()
                .frame(width: 400)
            HStack{
                Button(action: {
                    if day == "Monday" {
                        day = "Sunday"
                    }
                    else if day == "Sunday" {
                        day = "Saturday"
                    }
                    else if day == "Saturday" {
                        day = "Friday"
                    }
                    else if day == "Friday" {
                        day = "Thursday"
                    }
                    else if day == "Thursday" {
                        day = "Wednesday"
                    }
                    else if day == "Wednesday" {
                        day = "Tuesday"
                    }
                    else if day == "Tuesday" {
                        day = "Monday"
                    }
                }, label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
                Text("\(day)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Button(action: {
                    if day == "Monday" {
                        day = "Tuesday"
                    }
                    else if day == "Tuesday" {
                        day = "Wednesday"
                    }
                    else if day == "Wednesday" {
                        day = "Thursday"
                    }
                    else if day == "Thursday" {
                        day = "Friday"
                    }
                    else if day == "Friday" {
                        day = "Saturday"
                    }
                    else if day == "Saturday" {
                        day = "Sunday"
                    }
                    else if day == "Sunday" {
                        day = "Monday"
                    }
                }, label: {
                    Image(systemName: "arrow.forward.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                })
            }
            if day == "Monday" {
                List {
                    ForEach(monday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            else if day == "Tuesday" {
                List {
                    ForEach(tuesday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            else if day == "Wednesday" {
                List {
                    ForEach(wednesday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            else if day == "Thursday" {
                List {
                    ForEach(thursday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            else if day == "Friday" {
                List {
                    ForEach(friday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            else if day == "Saturday" {
                List {
                    ForEach(saturday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            else if day == "Sunday" {
                List {
                    ForEach(sunday, id: \.self) { theAssignment in
                        Text(theAssignment)
                    }
                }
            }
            HStack{
                Picker("Class", selection: $selectedClass) {
                    ForEach(Classes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.automatic)
                TextField("Enter Assignment", text: $newAssignment)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 225)
                    .onSubmit() {
                        assignments.append(newAssignment)
                    }
                Button(action: {
                  
                    if day == "Monday" {
                        monday.append(newAssignment)
                    }
                    else if day == "Tuesday" {
                        tuesday.append(newAssignment)
                        saveItems()
                    }
                    else if day == "Wednesday" {
                        wednesday.append(newAssignment)
                    }
                    else if day == "Thursday" {
                        thursday.append(newAssignment)
                    }
                    else if day == "Friday" {
                        friday.append(newAssignment)
                    }
                    else if day == "Saturday" {
                        saturday.append(newAssignment)
                    }
                    else if day == "Sunday" {
                        sunday.append(newAssignment)
                    }
                }, label: {
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .frame(width: 50, height: 40)
                    
                })
                
                
            }
            
            //   DatePicker("Choose Due Date", selection: $dueDate)
            //    .datePickerStyle(GraphicalDatePickerStyle()).opacity(showDatePicker ? 1 : 0)
            
            
        }
        
    }
    func saveItems() {
        UserDefaults.standard.set(tuesday, forKey: "SavedItems")
    }
    
    // Function to load the array from UserDefaults
    func loadItems() {
        if let savedItems = UserDefaults.standard.array(forKey: "SavedItems") as? [String] {
            tuesday = savedItems
        }
    }
}





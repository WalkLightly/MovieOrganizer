import json

# 1. Open the file and load the data
with open('/Users/michaelknight/Documents/Xcode Projects/MovieOrganizer/MovieOrganizer/Data/movies.json', 'r', encoding='utf-8') as file:
    data = json.load(file)
# 1 is a dvd, 
# 0 is a VHS

# schema in firestore:
# folder: string
# genre: [string] [3]
# isCableRecording: bool [1]
# location: String
# name: string [2]
# type: string
#
for d in data:
    print(d)
# print(data)
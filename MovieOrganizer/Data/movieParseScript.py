import json
import firebase_admin
from firebase_admin import credentials, firestore, db

# 1. Open the file and load the data]
# on macbook /Users/michaelknight/Documents/XcodeProjects/MovieOrganizer/MovieOrganizer/Data/movies.json
# on mini /Users/michaelknight/Documents/Xcode Projects/MovieOrganizer/MovieOrganizer/Data/movies.json

with open('/Users/michaelknight/Documents/XcodeProjects/MovieOrganizer/MovieOrganizer/Data/movies.json', 'r', encoding='utf-8') as file:
    data = json.load(file)
# 1 is a dvd, 
# 0 is a VHS

# schema in firestore:
# folder: string
# genre: [string] 
# isCableRecording: bool
# location: String
# name: string 
# type: string
#

def getGenres(gStr):
    genres = []
    for h in gStr:
        genres.append(h['Name'])

    return genres

def getFolder(fStr):
    return fStr['Folder']['Name']

def getLocation(lStr):
    return lStr['Spot']

movies = []
movie = {
    'isCableRecording': False,
    'name': '',
    'genres': [],
    'folder': '',
    'location': '',
    'type': ''
}

all_folders = {}
all_genres = {}

genresMaster = []
foldersMaster = []
folder = ""
location = ""
type = ""
isCable = ""
index = 0
good = ""

for d in data:
    genresMaster = getGenres(d['Genres'])
    folder = getFolder(d['Location'])
    location = getLocation(d['Location'])
    type = d['Type']
    isCable = d['IsCableRecording']

    movie = {
        'isCableRecording': False,
        'name': '',
        'genres': [],
        'folder': '',
        'location': '',
        'type': ''
    }

    movie['name'] = d['Name']
    movie['genres'] = genresMaster
    movie['folder'] = folder
    movie['isCableRecording'] = isCable
    movie['type'] = 'DVD' if type == 1 else 'VHS'
    movie['location'] = location
    movies.append(movie)



    for g in genresMaster:
        if g in all_genres:
            all_genres[g].append(d['Name'])
        else:
            all_genres[g] = []
            all_genres[g].append(d['Name'])

    # add the spot here as well, for easy viewing 
    if folder in all_folders:
        all_folders[folder].append({ 'name': d['Name'], 'spot': location})
    else:
        all_folders[folder] = []
        all_folders[folder].append({ 'name': d['Name'], 'spot': location})



# for key in all_genres:
#     print(key + " - " + str(len(all_genres[key])))
# for key in all_folders:
#     print(key + " - " + str(len(all_folders[key])))


##########################################################
# FOR THE FODLERS LOADING IN
##########################################################

# cred = credentials.Certificate("/Users/michaelknight/Documents/XcodeProjects/MovieOrganizer/MovieOrganizer/Data/db-key.json")
# firebase_admin.initialize_app(cred)
# db = firestore.client()
# for fold in all_folders:
#     collection_ref = db.collection("folders")

#     # 1. Query for documents meeting your criteria
#     query = collection_ref.where("name", "==", fold)
#     docs = query.stream()

#     counter = 0

#     # 2. Loop through results and update individually
#     for doc in docs:
#         # Get the document reference
#         doc_ref = collection_ref.document(doc.id)
        
#         # Update immediately via network request
#         doc_ref.update({
#             "movies": all_folders[fold]
#         })

##########################################################
# FOR THE GENRES LOADING IN
##########################################################

# cred = credentials.Certificate("/Users/michaelknight/Documents/XcodeProjects/MovieOrganizer/MovieOrganizer/Data/db-key.json")
# firebase_admin.initialize_app(cred)
# db = firestore.client()
# for gen in all_genres:
#     collection_ref = db.collection("genres")

#     # 1. Query for documents meeting your criteria
#     query = collection_ref.where("name", "==", gen)
#     docs = query.stream()

#     for doc in docs:
#         doc_ref = collection_ref.document(doc.id)
        
#         # Update immediately via network request
#         doc_ref.update({
#             "movies": all_genres[gen]
#         })
# 
# ##########################################################
# FOR THE MOVIES LOADING IN
##########################################################    
cred = credentials.Certificate("/Users/michaelknight/Documents/XcodeProjects/MovieOrganizer/MovieOrganizer/Data/db-key.json")
firebase_admin.initialize_app(cred)
db = firestore.client()
collection_ref = db.collection("movies")

# for m in movies:
# # 3. Add the record
# # .add() returns a tuple: (time_timestamp, document_reference)
#     update_time, doc_ref = collection_ref.add(m)

#print(ref.get())
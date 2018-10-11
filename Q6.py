import csv
import pandas as pd
from pprint import pprint
from collections import defaultdict

import math

def main():

        with open("actor_movies.txt") as f:
            reader_actors = csv.reader(f, delimiter="\t")
            data_actors = list(reader_actors)

        with open("actress_movies.txt") as f:
            reader_actress = csv.reader(f, delimiter="\t")
            data_actresses = list(reader_actress)

        actors = []
        actresses = []

        for idx, rows in enumerate(data_actors):

                tmp = [item for item in rows if item != '']
                actors.append(tmp)


        for idx, rows in enumerate(data_actresses):

                tmp = [item for item in rows if item != '']
                actresses.append(tmp)
        
        total_actors = actors + actresses

        
##        ##processing genre######
##        counterg = 0 
##        genres = []
##        genres_movies = dict()
##        with open("movie_genre.txt") as f:
##            movies_genres = csv.reader(f, delimiter="\t")
##            data_genres = list(movies_genres)
##
##        for idx, rows in enumerate(data_genres):
##                # progress check
##
##                tmp = [item for item in rows if item != '']
##                genres.append(tmp)
##
##        for row in genres:
##                datag = row
##                # progress check
##                
##
##                # put data of each row into a list
##                tmpg = datag
##                tmpg = [item for item in tmpg if item is not None]
##
##                # seperate out the movies and the corresponding actor
##                genreg = tmpg[1]
##                movieg = tmpg[0]
##
##                # organize data into dictionaries
##                genres_movies[movieg] = genreg
##   
##        core_genres = list(genres_movies.keys())
##        for print_genre in core_genres[:10]:
##                print(str(print_genre))
##  
##        
##
##
##        ##processing genre######

            
        actors_movies = {}
        movies_actors = defaultdict(set)
        movies_actors_fin = dict()

       
        for row in total_actors:
                data = row

                tmp = data
                tmp = [item for item in tmp if item is not None]


                tmpMovies = tmp[1:len(tmp)]
                actor = tmp[0]

                actors_movies[actor] = tmpMovies
                [movies_actors[movie].add(actor) for movie in tmpMovies]
               

        counter = 0
        for key, val in movies_actors.items():

                if len(val) >= 10:
                        movies_actors_fin[key] = val
                        counter = counter + 1

        print (counter)

      #  text_file = open("Movie_greater_5_Weight.txt", "w")
      #  text_file = open("processed_genre.txt", "w")
        cnt=1
        movieID_dict = dict()
        for keys in movies_actors_fin.keys():
            movieID_dict[keys] = cnt
            cnt = cnt + 1

        if 'Batman v Superman: Dawn of Justice (2016)' in movieID_dict:
            print(str(movieID_dict['Batman v Superman: Dawn of Justice (2016)'])+'Bat\n')
        if 'Mission: Impossible - Rogue Nation (2015)' in movieID_dict:
            print(str(movieID_dict['Mission: Impossible - Rogue Nation (2015)'])+'Mission\n')
        if 'Minions (2015)' in movieID_dict:
            print(str(movieID_dict['Minions (2015)'])+'Minions\n')
        for key, value in movieID_dict.items():
            if value == 66770:
                print(str(key) + '66770\n')
            if value == 60260:
                print(str(key) + '60260\n')
            if value == 49153:
                print(str(key) + '49153\n')
            if value == 222:
                print(str(key) + '222\n')
            if value == 12381:
                print(str(key) + '12381\n')
            if value == 11058:
                print(str(key) + '11058\n')
            if value == 86888:
                print(str(key) + '86888\n')
            if value == 189208:
                print(str(key) + '189208\n')
            if value == 84226:
                print(str(key) + '84226\n')
            if value == 118261:
                print(str(key) + '118261\n')
            if value == 50398:
                print(str(key) + '50398\n')
            if value == 173793:
                print(str(key) + '173793\n')
            if value == 176871:
                print(str(key) + '176871\n')
            if value == 180744:
                print(str(key) + '180744\n')
            if value == 203008:
                print(str(key) + '203008\n')
 

                
##            if keys in core_genres:
##                text_file.write(str(movieID_dict[keys]))
##                text_file.write('\t')
##                text_file.write(str(genres_movies[keys]))
##                text_file.write('\n')
            
##        count = 0 
##        for (i,j) in movies_actors_fin.items():
####             count = count + 1
####             print(count)
##             temp_set = set()
##             for act in j:
##                 for k in actors_movies[act]:
##                    if k in movies_actors_fin and movieID_dict[i] < movieID_dict[k] :
##                        if k not in temp_set:
##                            temp_set.add(k)
##                            intersect = len(movies_actors_fin[i].intersection(movies_actors_fin[k]))
##                            if intersect > 0:
##                                temp = float(intersect) / (len(movies_actors_fin[i])+len(movies_actors_fin[k])-float(intersect))
##                                text_file.write(str(movieID_dict[i]))
##                                text_file.write(',')
##                                text_file.write(str(movieID_dict[k]))
##                                text_file.write(',')
##                                text_file.write(str(temp))
##                                text_file.write('\n')
            


if __name__ == "__main__":
        main()

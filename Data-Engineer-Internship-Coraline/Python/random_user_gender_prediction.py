import requests
import pandas as pd

# define static value
rand_user_url = 'https://randomuser.me/api'
predict_user_url = 'https://api.genderize.io/'
user_amt = 20

# function to fetch api 
# return data in json format
def get_data(url, params=None, headers=None):
    try:
        res = requests.get(url,params,headers=headers)
        res.raise_for_status() 
        return res.json()
    except requests.RequestException as e:
        print(f"fetching data failed : {e}")
        return None 

# function to extract data from random user API
# return first name, last name and actual_gender in dictionary format
def generate_random_user(num) :
    users = []
    for _ in range(num):
        try:
            res = get_data(rand_user_url)
            data = {
                "first_name": res['results'][0]['name']['first'],
                "last_name": res['results'][0]['name']['last'],
                "gender(actual)": res['results'][0]['gender']
            }
            users.append(data)
        except (KeyError, IndexError) as e:
            print(f"KeyError or IndexError occured: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")
    return users


# function to generate prediction from prediction API
# return :
#     1. gender
#     2. probability
def generate_prediction(name):
    res = get_data(predict_user_url, params={'name': name})
    if res:
        gender = res.get('gender')
        probability = res.get('probability')
        return gender, probability
    else:
        return None, None

if __name__ == "__main__" :
    # generate 20 users and stored in variable
    users = generate_random_user(user_amt)
    user_df = pd.DataFrame(users)
    print(user_df)

    # using applymap to with column first_name to send each name to function generate_prediction
    # convert returned data into Series and create new columns predict_gender and probability from Series
    user_df[['gender(predict)','probability']] = user_df['first_name'].apply(lambda name: pd.Series(generate_prediction(name)))
    print(user_df)

    # if data from column actual_gender and predict_gender doesn't inconsistency we need to transformatoin into same format first
    # (e.g. column actual_gender use 'F' and 'M' but predict_gender use 'female' and 'male' this is inconsistency )
    user_df['same_gender'] = user_df['gender(actual)'] == user_df['gender(predict)']
    print(user_df)
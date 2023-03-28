import pandas as pd
import datetime
import time
import pickle
import numpy as np

class ModelHelper():
    def __init__(self):
        pass

    def winePredictions(self, fixed_acidity, volatile_acidity, citric_acid, residual_sugar, chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density, pH, sulphates, alcohol):

        x = np.array([[fixed_acidity, volatile_acidity, citric_acid, residual_sugar, chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density, pH, sulphates, alcohol]])

        filename = 'finalized_model.sav'
        model = pickle.load(open(filename, 'rb'))
        filename_2 = 'finalized_model_2.sav'
        model_2 = pickle.load(open(filename_2, 'rb'))

        good_bad_prediction = model.predict(x)[0]
        color_prediction = model_2.predict(x)[0]

        good_bad_prediction = "Good" if good_bad_prediction == 1 else "Bad"
        color_prediction = "White" if color_prediction == 1 else "Red"

        return good_bad_prediction, color_prediction
    
    
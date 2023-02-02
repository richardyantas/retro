"""Tests for web app."""
import os
import json
from pathlib import Path
from unittest import TestCase
from backend.app import app

REPO_DIRNAME = Path(__file__).parents[1].resolve()
SUPPORT_DIRNAME = REPO_DIRNAME / "tests"
FILENAME = SUPPORT_DIRNAME / "input.json"
EXPECTED_PRED = [  22,   26, 2008]

# In workdir path
# python3 -m pytest -v

class TestIntegrations(TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_index(self):
        response = self.app.get("/")
        assert response.get_data().decode() == "Recommender system!"

    def test_predict(self):                        
        response = self.app.post("/", json={"todo_ID": 12, "User_ID":8, "details":[11,13,1004]})
        json_data = response.get_json()
        self.assertEqual(json_data["vec"], EXPECTED_PRED)        

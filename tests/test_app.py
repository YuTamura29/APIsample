import json
import pytest
import app as service


@pytest.fixture
def api():
    return service.api


def test_hello_world(api):
    name = 'tanaka'
    r = api.requests.get("/_healthcheck", params={'name': name})
    c = json.loads(r.content)
    assert r.status_code == 200
    assert c["message"] == "ok_" + name

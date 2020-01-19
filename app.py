import responder

api = responder.API()

@api.route("/_healthcheck")
async def healthcheck(req, resp):
    params = {k: v for k, v in req.params.items()}
    resp.media = {'message': 'ok_' + params['name']}

if __name__ == '__main__':
    api.run(address='0.0.0.0', port=5042)
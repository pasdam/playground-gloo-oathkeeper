# playground-gloo-oathkeeper

K8s playground to test Gloo Edge and Ory Oathkeeper integration.

## Requirements

* [k3d](https://k3d.io/).

## Usage

To spin up the whole system:

```sh
./start.sh
```

This will:

1. create the k8s cluster using k3d;
2. deploy the backend;
3. generate JSON Web Key Set (JWKS), if not already present;
4. deploy Oathkeeper;
5. deploy Gloo.

Add kid header

Once this is done you can generate a JWT using the online editor from
[jwt.io](https://jwt.io/).

The JWT header should be like:

```json
{
  "alg": "HS256",
  "typ": "JWT",
  "kid": "<kid>"
}
```

where `alg` should be *HS256* (same as the one configured in
[values.yaml](./oathkeeper/values.yaml)) and `kid` is the one in
[jwks.json](./oathkeeper/jwks.json).

The payload data should contain the required claims, in particular for this
demo is important to set the `sub` filed, which should contain the subject ID,
such value will be extracted and set in the `X-User-Id` request header.

The secret to sign/verify the token should be the value in the `k` field in
[jwks.json](./oathkeeper/jwks.json). Note that such value is base64 encoded, so
make sure to select the right option in the online editor.

Then you can perform a request with:

```sh
JWT=[value copied from the online editor]
curl http://localhost:8080/anything/header -H "Authorization: Bearer $JWT"
```

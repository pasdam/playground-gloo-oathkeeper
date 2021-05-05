# playground-gloo-outhkeeper

K8s playground to test Gloo Edge and Ory Oauthkeeper integration.

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

Once this is done you can generate a JWT using the online editor from
[jwt.io](https://jwt.io/), just make sure the algorithm is *HS256* (the same as
the one configured in [values.yaml](./oathkeeper/values.yaml)) and the key is
the one in [jwks.json](./oathkeeper/jwks.json) in the field `k`.

Then you can perform a request with:

```sh
JWT=[value copied from the online editor]
curl http://localhost:8080/anything/header -H "Authorization: Bearer $JWT"
```

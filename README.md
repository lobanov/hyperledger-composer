# hyperledger-composer
This image contains basic setup for a turn-key environment allowing Hyperledger Composer CLI and Playground to be used.
The image comes with some basic utilies like curl and git to make development easier to start.

Note: The image does not include any Hyperledger Fabric or Docker binaries.

## Usage

The image works perfectly with lightweight container hosting environments like Hyper.sh.
For example, use the following commands to bootstrap the environment on Hyper:

~~~~
hyper pull igorlo/hyperledger-composer
hyper volume create --name composer-root --size=10
hyper run -d --name=composer --size=l1 -p 8080:8080 -v composer-root:/root igorlo/hyperledger-composer
hyper fip attach <your IP> composer
~~~~
   
Then use http://<your IP>:8080 to access Hyperledger Playground webapp. Note that it's recommended to have at least 4GB of RAM to run Composer, hence L1 size above. At the time of writing this one hour of L1 container on Hyper costs circa $0.10.

If you don't want to use Playground, but simply want CLI access, then use the following command to start the container in the interactive mode.

~~~~
hyper run -it --rm --name=composer --size=l1 -v composer-root:/root igorlo/hyperledger-composer bash
~~~~

Note that /root is mounted to a persistent volume, so the container could be ephemereal.

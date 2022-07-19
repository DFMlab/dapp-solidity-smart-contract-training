import Web3 from "web3";
import { newKitFromWeb3 } from "@celo/contractkit";
import BigNumber from "bignumber.js";
import Swal from 'sweetalert2'
import ContractAbi from "./../contract/abi/tree.json";

const ContractAddress = "0x297C6FEc94A741818A5F3854E6C48d4C52E0379D"
const WEI = 18

/**************************************************************    VARIABLE     *************************************************************************/

let kit;
let contract;
let trees = [];

/**************************************************************    VARIABLE  END   *************************************************************************/

/**************************************************************    EVENT LISTENER   *************************************************************************/

const ConnectButton = document.getElementById("connectButton")
const DisconnectButton = document.getElementById("disconnectButton")
const AddNewTreeButton = document.getElementById("addNewTree")

ConnectButton.addEventListener('click', async () => { 
    await connect()
    ConnectButton.classList.add("hide")
    ConnectButton.classList.remove("show")
    DisconnectButton.classList.add("show")
    DisconnectButton.classList.remove("hide")
})

DisconnectButton.addEventListener('click', async () => { 
    await disconnect()
    ConnectButton.classList.add("show")
    ConnectButton.classList.remove("hide")
    DisconnectButton.classList.add("hide")
    DisconnectButton.classList.remove("show")
})

AddNewTreeButton.addEventListener('click', async () => { 
    await addTreeWidget()
})

window.addEventListener("load", async () => {
    await connect()

    
    await getTrees()
    addEventListenerToBuyButton()
    RenderTreeCardsTemplate()
})

/**************************************************************    EVENT LISTENER   *************************************************************************/

/**************************************************************    FUNCTION     *************************************************************************/


async function connect() {
    console.log("connecting to wallet");
    if (window.celo && window.celo.isConnected) {
        try {
            window.celo.enable()
            const web3 = new Web3(window.celo);
            kit = newKitFromWeb3(web3);

            const accounts = await kit.web3.eth.getAccounts();
            kit.defaultAccount = accounts[0];

            contract = new kit.web3.eth.Contract(ContractAbi, ContractAddress);


        } catch (e) {
            notifyError(e);
        }
    }

}


function addEventListenerToBuyButton()  {
    const BuyButtons = document.querySelectorAll(".buyButton")

    BuyButtons.forEach(BuyButton => {
        BuyButton.addEventListener("click", async () => {
            const id = BuyButton.getAttribute("tree-id")
            const price = BuyButton.getAttribute("tree-price")
            await buyTree(parseInt(id), parseInt(price))
        })
    })
}


async function getTrees() {

    const treeCount = await contract.methods._treeCount().call();

    for(let i = 0; i<treeCount; i++) {

        const tree = await contract.methods._trees(i).call();

        console.log(tree)

        trees.push(tree)

    }

}

async function buyTree(id, price) {
    console.log(kit.defaultAccount, price, id)
    await contract.methods.buyTree(id).send({from: kit.defaultAccount, value: price });
    await notifySuccess("purchased successfully")
    await refreshTrees()
}

async function refreshTrees() {
    const treesTemplate = document.getElementById("treeList")
    treesTemplate.innerHTML = ""
    trees = []
    await getTrees()
    RenderTreeCardsTemplate()
}

async function addTree(price, image) {
    console.log(kit.defaultAccount, price, image)
    await contract.methods.addTree(new BigNumber(price).shiftedBy(WEI).toString(), image).send({from: kit.defaultAccount });
    await notifySuccess("added successfully")
    await refreshTrees()
}

async function disconnect() {
    localStorage.clear()
}


/**************************************************************    FUNCTION END     *************************************************************************/


/**************************************************************    TEMPLATE     *************************************************************************/


function TreeCardTemplate(id, price, image, owner) {
    const cardTemplate = document.createElement("div");

    cardTemplate.className = "card"

    cardTemplate.innerHTML = `
        <div class="card-body">
            <div class="avatar-div">
                <img src="/assets/images/avatar.png" alt="avatar">
                <p>@${owner.substring(0, 8)}...</p>
            </div>
            <div class="img-holder">
                <img src="${image}" alt="card" class="card-img">
            </div>
            <div>
                <p class="card-title">
                    Tree Project #${id}
                </p>
                <p class="card-subtitle">
                    Current Bid
                </p>
                <p class="card-price">
                    ${new BigNumber(price).shiftedBy(-WEI).toString()} CELO
                </p>
        </div>
        <div class="button-wrapper">
            <button tree-id="${id}" tree-price="${price}" class="buyButton">Buy Now</button>
        </div>
    </div>
    `

    return cardTemplate
}


/**************************************************************    TEMPLATE END    *************************************************************************/



/**************************************************************    RENDERERS     *************************************************************************/


function RenderTreeCardsTemplate() {
    const treesTemplate = document.getElementById("treeList")
    treesTemplate.innerHTML = ""

    trees.forEach(tree => {
        const treeTemplate = TreeCardTemplate(tree["id"], tree["price"], tree["image"], tree["owner"])

        treesTemplate.appendChild(treeTemplate)
    })

    addEventListenerToBuyButton()

}


/**************************************************************    RENDERERS END    *************************************************************************/


/**************************************************************    NOTIFICATION     *************************************************************************/

// initialize sweet alert toast message

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
})

// to be used to notify of success

async function notifySuccess(message) {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })
    await Toast.fire({
        icon: 'success',
        title: message
    })
}

async function notifyError(message) {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })
    await Toast.fire({
        icon: 'error',
        title: message
    })
}

async function addTreeWidget() {
    new Swal({
        title: 'Multiple inputs',
        html:
          '<input placeholder="image url" id="swal-input1" class="swal2-input">' +
          '<input placeholder="price" id="swal-input2" class="swal2-input">',
        preConfirm: function () {
          return new Promise(function (resolve) {
            resolve([
                document.getElementById("swal-input1").value,
                document.getElementById("swal-input2").value
            ])
          })
        },
      }).then(async function (result) {
        const { value } = result;
        await addTree(parseInt(value[1]), value[0])
      }).catch(Swal.noop)
}


/**************************************************************    NOTIFICATION END    *************************************************************************/
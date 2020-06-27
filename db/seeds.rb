Store.destroy_all

Store.create!([
    {
        id: 1,
        name: "Aden Shoes Shop",
        phone_number: "+628888888111",
        description: 'Menjual macam macam sepatu'
    },
    {
        id: 2,
        name: "Jun Pet Shop",
        phone_number: "+628888888111",
        description: 'Menjual pakan hewan'
    }
])

Label.destroy_all

Label.create!([
    { id: 1, name: "Soccer" },
    { id: 2, name: "Run" },
    { id: 3, name: "Cat Food" },
    { id: 4, name: "Kitten Food" },
    { id: 5, name: "Shoes" },
    { id: 6, name: "Dog Food" }
])

Product.destroy_all

Product.create!([
    {
        id: 1,
        name: "Adinda",
        price: 500000,
        description: '',
        store_id: 1,
    },
    {
        id: 2,
        name: "Nikee",
        price: 500000,
        description: '',
        store_id: 1,
    },
    {
        id: 3,
        name: "Universal Kitten",
        price: 24000,
        description: '',
        store_id: 2,
    },
    {
        id: 4,
        name: "Universal Udang",
        price: 24000,
        description: '',
        store_id: 2,
    }
])

LabelsProduct.destroy_all

LabelsProduct.create!([
    { label_id: 1, product_id: 1 },
    { label_id: 5, product_id: 1 },
    { label_id: 3, product_id: 4 },
    { label_id: 4, product_id: 4 }
])


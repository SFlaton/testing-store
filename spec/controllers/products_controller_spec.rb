require 'rails_helper'

describe ProductsController do
  let(:product) { Product.create(
    name: "Car",
    description: "a nice family vehicle",
    price: 5000
        ) }

  describe "GET #index" do
    it "assigns @products and renders the index template" do


      get :index

      expect(assigns(:products)).to eq([product])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns @product and renders the show template" do

      get :show, id: product.id

      expect(assigns(:product)).to eq(product)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product and renders the new template" do

      get :new

      expect(assigns(:product)).to be_a_new(Product)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do

    before do
      get :edit, id: product.id
    end

    it "assigns the requested product as @product" do
      expect(assigns(:product)).to eq(product)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) {
        {product: {name: "bike", description: "very sporty", price: 500}}
      }

      it "assigns a newly created product as @product" do
        post :create, valid_params
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "created a new Product" do
        expect {
          post :create, valid_params
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, valid_params
        expect(response).to redirect_to(Product.last)
      end
    end
    context "with invalid params" do
      let (:invalid_params) {
        { product: {name: "motorbike", description: nil, price: 6000}}
      }

      it "re-renders the 'new' template" do
        post :create, invalid_params
        expect(response).to render_template("new")
      end
    end
  end


end

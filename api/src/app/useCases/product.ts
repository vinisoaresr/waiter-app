import { Request, Response } from 'express';
import { Product } from '../models/Product';

export async function listProducts(req: Request, res: Response) {
  try {
    const products = await Product.find();
    res.json(products);
  } catch (error) {
    res.status(500).json({ message: error });
  }
}

export async function createProduct(req: Request, res: Response) {
  try {
    const imagePath = req.file?.filename;
    const { name, description, price, category, ingredients } = req.body;
    const product = await Product.create(
      {
        name,
        description,
        price: Number(price),
        category,
        ingredients: ingredients ? JSON.parse(ingredients) : [],
        imagePath,
      },
    );
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error });
  }
}


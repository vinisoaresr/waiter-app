import { Request, Response } from 'express';
import { Category } from '../models/Category';
import { Product } from '../models/Product';

export async function listCategories(req: Request, res: Response) {
  try {
    const categories = await Category.find();
    res.json(categories);

  } catch (error) {
    res.status(500).json({ message: error });
  }
}

export async function createCategory(req: Request, res: Response) {
  try {
    const category = new Category(req.body);
    await category.save();
    res.json(category);
  } catch (error) {
    res.status(500).json({ error: error });
  }
}

export async function listProductsByCategory(req: Request, res: Response) {
  try {
    const products = await Product.find({ category: req.params.categoryId });
    res.json(products);
  } catch (error) {
    res.status(500).json({ message: error });
  }
}

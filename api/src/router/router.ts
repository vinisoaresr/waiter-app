import path from 'node:path';
import { Router } from 'express';
import multer from 'multer';

import { createCategory, listCategories, listProductsByCategory } from '../app/useCases/category';
import { changeOrderStatus, createOrder, deleteOrder, listOrder } from '../app/useCases/order';
import { createProduct, listProducts } from '../app/useCases/product';


export const router = Router();

const upload = multer({
  storage: multer.diskStorage({
    destination(req, file, callback) {
      callback(null, path.resolve(__dirname, '..', 'uploads'));
    },
    filename(req, file, callback) {
      callback(null, `${Date.now()}-${file.originalname}`);
    }
  })
});

router.get('/categories', listCategories);

router.post('/categories', createCategory);

router.get('/categories/:categoryId/products', listProductsByCategory);

router.get('/products', listProducts);

router.post('/products', upload.single('image'), createProduct);

router.get('/orders', listOrder);

router.post('/orders', createOrder);

router.patch('/orders/:id', changeOrderStatus);

router.delete('/orders/:id', deleteOrder);


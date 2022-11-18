import { Request, Response } from 'express';
import { Order } from '../models/Order';

export async function listOrder(req: Request, res: Response) {
  try {
    const products = await Order.find().populate('products.product').sort({ createdAt: -1 });
    res.json(products);
  } catch (error) {
    res.status(500).json({ message: error });
  }
}

export async function createOrder(req: Request, res: Response) {
  try {
    const order = new Order(req.body);
    const savedOrder = await order.save();
    res.json(savedOrder);
  } catch (error) {
    res.status(500).json({ message: error });
  }
}

export async function changeOrderStatus(req: Request, res: Response) {
  try {
    const { id } = req.params;
    const { status } = req.body;

    if (!['WAITING', 'IN_PRODUCTION', 'DONE'].includes(status)) {
      return res.status(400).json({ message: 'Invalid status. Accepted status: WAITING, IN_PRODUCTION, DONE' });
    }

    const order = await Order.findByIdAndUpdate(id, { status });
    return res.status(204).send();

  } catch (error) {
    return res.status(404).json({ message: 'Order not found' });
  }
}

export async function deleteOrder(req: Request, res: Response) {
  try {
    const { id } = req.params;
    await Order.findByIdAndDelete(id);
    res.status(200).send();
  } catch (error) {
    res.status(500).json({ message: 'Order not found.' });
  }
}

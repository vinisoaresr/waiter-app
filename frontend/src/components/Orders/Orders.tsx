import { Order } from '../../models/Order';
import { OrderBoard } from '../OrderBoard/OrderBoard';
import { Container } from './styles';


export function Orders() {
  return (
    <Container>
      <OrderBoard icon='⏳' title='Fila de Espera' orders={mockOrders} />
      <OrderBoard icon='🏋️‍♂️' title='Em preparação' orders={[]} />
      <OrderBoard icon='✅' title='Finalizado' orders={[]} />
    </Container>
  );
}



const mockOrders: Order[] = [
  {
    _id: '6372e48cbcd195b0d3d0f7f3',
    table: '123',
    status: 'WAITING',
    products: [
      {
        product: {
          name: 'Pizza quatro queijos',
          imagePath: '1668781481835-quatro-queijos.png',
          price: 40,
        },
        quantity: 3,
        _id: '6372e48cbcd195b0d3d0f7f4'
      },
      {
        product: {
          name: 'Coca cola',
          imagePath: '1668781949424-coca-cola.png',
          price: 7,
        },
        quantity: 2,
        _id: '6372e48cbcd195b0d3d0f7f5'
      }
    ],
  }
];

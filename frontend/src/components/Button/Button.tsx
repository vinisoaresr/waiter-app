import { ReactNode } from 'react';
import { Container } from './styles';

interface ButtonProps {
  disabled?: boolean;
  callback?: () => void;
  text: string;
  label?: string;
}

export function Button({ text, label, callback, disabled = false }: ButtonProps) {
  return (
    <Container>
      <button onClick={callback}>
        <span>{label}</span>
        <strong>{text}</strong>
      </button>
    </Container>
  );
}

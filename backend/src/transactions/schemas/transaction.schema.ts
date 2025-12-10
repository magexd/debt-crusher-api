import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';

export type TransactionDocument = HydratedDocument<Transaction>;

@Schema({ timestamps: true }) // Esto crea createdAt y updatedAt automáticos
export class Transaction {
  @Prop({ required: true })
  concept: string;

  @Prop({ required: true })
  amount: number; // Positivo = Ingreso, Negativo = Gasto

  @Prop({ required: true })
  category: string; // Ej: Comida, Transporte, Deuda
}

export const TransactionSchema = SchemaFactory.createForClass(Transaction);

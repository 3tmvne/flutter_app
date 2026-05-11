import { Injectable } from '@nestjs/common';

@Injectable()
export class ChatbotService {
  findAll() {
    return { message: 'Chatbot module ready' };
  }
}

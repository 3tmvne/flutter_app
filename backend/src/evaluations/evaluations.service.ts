import { Injectable } from '@nestjs/common';

@Injectable()
export class EvaluationsService {
  findAll() {
    return { message: 'Evaluations module ready' };
  }
}

import { Injectable } from '@nestjs/common';

@Injectable()
export class CentersService {
  findAll() {
    return { message: 'Centers module ready' };
  }
}

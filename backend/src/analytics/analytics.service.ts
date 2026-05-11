import { Injectable } from '@nestjs/common';

@Injectable()
export class AnalyticsService {
  getSummary() {
    return { message: 'Analytics module ready' };
  }
}

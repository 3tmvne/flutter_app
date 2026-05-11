import { Controller, Get } from '@nestjs/common';
import { CentersService } from './centers.service';

@Controller('centers')
export class CentersController {
  constructor(private readonly centersService: CentersService) {}

  @Get()
  findAll() {
    return this.centersService.findAll();
  }
}

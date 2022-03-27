import { Injectable } from '@nestjs/common';
import { Trip } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { CreateTripDto } from './dto/create-trip.dto';
import { UpdateTripDto } from './dto/update-trip.dto';

@Injectable()
export class TripService {
  constructor(private readonly prismaService: PrismaService) {}
  async create(createTripDto: CreateTripDto) {
    return this.prismaService.trip.create({ data: createTripDto });
  }

  async findAll(): Promise<Trip[]> {
    return this.prismaService.trip.findMany();
  }

  async findOne(id: number) {
    return this.prismaService.trip.findUnique({
      where: { id },
    });
  }

  async update(id: number, updateTripDto: UpdateTripDto) {
    return this.prismaService.trip.update({
      where: { id },
      data: updateTripDto,
    });
  }

  async remove(id: number) {
    return this.prismaService.trip.delete({ where: { id } });
  }
}

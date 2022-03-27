import { Trip } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateTripDto } from './dto/create-trip.dto';
import { UpdateTripDto } from './dto/update-trip.dto';
export declare class TripService {
    private readonly prismaService;
    constructor(prismaService: PrismaService);
    create(createTripDto: CreateTripDto): Promise<Trip>;
    findAll(): Promise<Trip[]>;
    findOne(id: number): Promise<Trip>;
    update(id: number, updateTripDto: UpdateTripDto): Promise<Trip>;
    remove(id: number): Promise<Trip>;
}

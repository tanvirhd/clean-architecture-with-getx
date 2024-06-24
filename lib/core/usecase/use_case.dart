import 'package:cleanwithgetx/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<output,input>{
  Future<Either<Failure,output>> execute(input inputParams);
}
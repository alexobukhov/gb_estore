package ru.gb.estore.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TimeDuration {

    @Around("execution(public * ru.gb.estore.service.*.*())")
    public Object methodProfiling(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        long begin = System.currentTimeMillis();
        Object out = proceedingJoinPoint.proceed();
        long end = System.currentTimeMillis();
        long duration = end - begin;
        System.out.println(proceedingJoinPoint.getSignature() + ": " + duration);
        return out;
    }
}

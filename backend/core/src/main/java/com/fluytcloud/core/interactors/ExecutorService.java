package com.fluytcloud.core.interactors;

import com.fluytcloud.core.entities.UserInfoContext;
import io.smallrye.context.SmallRyeThreadContext;
import io.smallrye.context.api.ThreadContextConfig;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.control.ActivateRequestContext;
import jakarta.inject.Inject;
import org.eclipse.microprofile.context.ThreadContext;

import java.util.concurrent.Executors;

@ApplicationScoped
public class ExecutorService {

    private final java.util.concurrent.ExecutorService executor = Executors.newFixedThreadPool(100);

    @Inject
    @ThreadContextConfig(unchanged = ThreadContext.ALL_REMAINING)
    SmallRyeThreadContext threadContext;

    public void execute(Runnable runnable) {
        var currentUserInfo = UserInfoContext.getCurrentUserInfo();
        executor.execute(() -> {
            SmallRyeThreadContext.withThreadContext(threadContext);
            UserInfoContext.setCurrentTenant(currentUserInfo);

            run(runnable);
        });
    }

    @ActivateRequestContext
    protected void run(Runnable runnable) {
        runnable.run();
    }
}

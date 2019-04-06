include project.conf.mk
include build.conf.mk

all: $(EXE)
.PHONY: all

clean:
	rm $(BUILT)
.PHONY: clean

$(EXE): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS) $(LDLIBS)

%.c.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.cpp.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@
